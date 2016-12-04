# --
# Kernel/Language/hu_CustomerSelfRegistrationCreateTicket.pm - the Hungarian translation of CustomerSelfRegistrationCreateTicket
# Copyright (C) 2016 Perl-Services.de, http://perl-services.de/
# Copyright (C) 2016 Balázs Úr, http://www.otrs-megoldasok.hu/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::hu_CustomerSelfRegistrationCreateTicket;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation} || {};

    # Custom/Kernel/System/CustomerUser/Event/SelfRegistrationCreateTicket.pm
    $Lang->{'Customer User Created'} = 'Ügyfél-felhasználó létrehozva';
    $Lang->{'New User'} = 'Új felhasználó';

    # Kernel/Config/Files/CustomerSelfRegistrationCreateTicket.xml
    $Lang->{'Title for ticket.'} = 'A jegy címe.';
    $Lang->{'New Customer User'} = 'Új ügyfél-felhasználó';
    $Lang->{'Queue for ticket.'} = 'A jegy várólistája.';
    $Lang->{'Priority for ticket.'} = 'A jegy prioritása.';
    $Lang->{'State for ticket.'} = 'A jegy állapota.';
    $Lang->{'Body for ticket.'} = 'A jegy törzse.';
    $Lang->{'Event module that creates a ticket when a customer registers himself.'} =
        'Eseménymodul, amely létrehoz egy jegyet, ha egy ügyfél regisztrálja magát.';
}

1;
