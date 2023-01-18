# --
# Copyright (C) 2016 - 2023 Perl-Services.de, https://perl-services.de
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::CustomerUser::Event::SelfRegistrationCreateTicket;

use strict;
use warnings;

use Kernel::System::ObjectManager;

our @ObjectDependencies = qw(
    Kernel::Config
    Kernel::Language
    Kernel::System::Log
    Kernel::System::Ticket
    Kernel::System::Ticket::Article
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject   = $Kernel::OM->Get('Kernel::Config');
    my $LanguageObject = $Kernel::OM->Get('Kernel::Language');
    my $LogObject      = $Kernel::OM->Get('Kernel::System::Log');
    my $TicketObject   = $Kernel::OM->Get('Kernel::System::Ticket');
    my $ArticleObject  = $Kernel::OM->Get('Kernel::System::Ticket::Article');

    # create ticket only when customer user registered itself
    my $IsSelfRegistered;

    LEVEL:
    for my $Level ( 1 .. 4 ) {
        my ($Package) = caller( $Level );
        if ( $Package eq 'Kernel::System::Web::InterfaceCustomer' ) {
            $IsSelfRegistered = 1;
            last LEVEL;
        }
    }

    return 1 if !$IsSelfRegistered;

    # check needed stuff
    for my $Needed (qw( Data Event Config UserID )) {
        if ( !$Param{$Needed} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );

            return;
        }
    }

    for my $NeededData (qw( UserLogin NewData )) {
        if ( !$Param{Data}->{$NeededData} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Need $NeededData in Data!"
            );

            return;
        }
    }

    my $Title = $LanguageObject->Translate(
        $ConfigObject->Get('CUSRTC::Title') // 'Customer User Created',
    );

    my $Queue    = $ConfigObject->Get('CUSRTC::Queue')    // 'Misc';
    my $Priority = $ConfigObject->Get('CUSRTC::Priority') // '3 normal';
    my $State    = $ConfigObject->Get('CUSRTC::State')    // 'new';

    my $TicketID = $TicketObject->TicketCreate(
        Title        => $Title,
        Queue        => $Queue,
        Lock         => 'unlock',
        Priority     => $Priority,
        State        => $State,
        CustomerID   => $Param{Data}->{NewData}->{UserCustomerID},
        CustomerUser => $Param{Data}->{NewData}->{UserLogin},
        OwnerID      => 1,
        UserID       => 1,
    );

    return 1 if !$TicketID;

    my $LocalOM      = Kernel::System::ObjectManager->new();
    my $LayoutObject = $LocalOM->Get('Kernel::Output::HTML::Layout');

    my $Body = $LayoutObject->Output(
        Template => (
            $ConfigObject->Get('CUSRTC::Body') // $LanguageObject->Translate('New User') . ': [% Data.UserLogin %]'
        ),
        Data     => $Param{Data}->{NewData},
    );

    $Body = $LayoutObject->RichTextDocumentComplete(
        String => $Body,
    );

    $Kernel::OM->Get('Kernel::System::Ticket::Article::Backend::Internal')->ArticleCreate(
        TicketID             => $TicketID,
        SenderType           => 'customer',
        IsVisibleForCustomer => 0,
        From                 => $Param{Data}->{NewData}->{UserEmail},
        To                   => 'otrs@localhost',
        Subject              => $Title,
        Body                 => $Body,
        ContentType          => 'text/html; charset=utf-8',
        HistoryType          => 'AddNote',
        HistoryComment       => '%%',
        UserID               => 1,
    );

    return 1;
}

1;
