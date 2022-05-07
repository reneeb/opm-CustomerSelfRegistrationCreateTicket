# --
# Kernel/Language/de_CustomerSelfRegistrationCreateTicket.pm - the German translation of CustomerSelfRegistrationCreateTicket
# Copyright (C) 2016 - 2022 Perl-Services.de, https://www.perl-services.de/
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
    $Lang->{'Customer User Created'} = 'Neuer Kundenbenutzer erstellt';
    $Lang->{'New User'} = 'Neuer Benutzer';

    # Kernel/Config/Files/CustomerSelfRegistrationCreateTicket.xml
    $Lang->{'Title for ticket.'} = 'Titel für das Ticket';
    $Lang->{'New Customer User'} = 'Neuer Kundenbenutzer';
    $Lang->{'Queue for ticket.'} = 'Queue für das Ticket';
    $Lang->{'Priority for ticket.'} = 'Priorität für das Ticket';
    $Lang->{'State for ticket.'} = 'Status für das Ticket';
    $Lang->{'Body for ticket.'} = 'Text für das Ticket';
    $Lang->{'Event module that creates a ticket when a customer registers himself.'} = 'Eventmodul, das ein Ticket erstellt wenn ein Kundenbenutzer sich selbst registriert.';
}

1;
