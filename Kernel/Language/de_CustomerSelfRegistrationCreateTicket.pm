# --
# Kernel/Language/de_CustomerSelfRegistrationCreateTicket.pm - the German translation of CustomerSelfRegistrationCreateTicket
# Copyright (C) 2016 Perl-Services.de, http://perl-services.de/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_CustomerSelfRegistrationCreateTicket;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation} || {};

    # Custom/Kernel/System/CustomerUser/Event/SelfRegistrationCreateTicket.pm
    $Lang->{'Customer User Created'} = '';
    $Lang->{'New User'} = '';

    # Kernel/Config/Files/CustomerSelfRegistrationCreateTicket.xml
    $Lang->{'Title for ticket.'} = '';
    $Lang->{'New Customer User'} = '';
    $Lang->{'Queue for ticket.'} = '';
    $Lang->{'Priority for ticket.'} = '';
    $Lang->{'State for ticket.'} = '';
    $Lang->{'Body for ticket.'} = '';
    $Lang->{'Event module that creates a ticket when a customer registers himself.'} = '';
}

1;
