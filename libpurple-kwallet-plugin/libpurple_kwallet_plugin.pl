##########################################################################
# This program is free software: you can redistribute it and/or modify   #
# it under the terms of the GNU General Public License as published by   #
# the Free Software Foundation, either version 3 of the License, or      #
# (at your option) any later version.                                    #
#                                                                        #
# This program is distributed in the hope that it will be useful,        #
# but WITHOUT ANY WARRANTY; without even the implied warranty of         #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          #
# GNU General Public License for more details.                           #
#                                                                        #
# You should have received a copy of the GNU General Public License      #
# along with this program.  If not, see <http://www.gnu.org/licenses/>.  #
##########################################################################

use Purple;
use Net::DBus;

%PLUGIN_INFO = (
    perl_api_version => 2,
    name             => "KWallet",
    version          => "0.1",
    summary          => "Use KWallet to store passwords.",
    description      => "Use KWallet to store passwords instead of the default plaintext file.\n" .
                        "When this plugin is enabled passwords are saved to KWallet for all accounts, regardless if \"remember password\" is checked or not. " .
                        "If it is checked then the passwords will be *saved in the plaintext file also* which " .
                        "goes a bit against the main purpose of this plugin (storing passwords in a secure manner). But then again, it is the users choice...",
    author           => "Andrei Mihaila <andrei.mihaila\@gmail.com>",
    url              => "http://gitorious.org/libpurple-kwallet-plugin/",
    load             => "plugin_load",
    unload           => "plugin_unload"
);

$folder           = "libpurple";
$application_name = "Pidgin";

%engine_data = (
    dbus_object => null,
    handle      => 0,
);

sub plugin_init {
    return %PLUGIN_INFO;
}

sub get_kwallet_dbus_handle {
    if ($engine_data{dbus_object} == null) {
        eval {
            $kwallet = Net::DBus->session->get_service('org.kde.kwalletd')->get_object('/modules/kwalletd');
        };
        if ($@) {
            Purple::Debug::error("kwallet_password", "Error connecting to KWallet via DBus: $@.\n");
            return false;
        }

        if ($kwallet == null) {
            Purple::Debug::error("kwallet_password", "Cannot connect to KWallet via DBus.\n");
            return false;
        }

        $engine_data{dbus_object} = $kwallet;
    }

    return $engine_data{dbus_object};
}

sub open_local_kwallet {
    my $kwallet = get_kwallet_dbus_handle();
    if ($kwallet == null) {
        return null;
    }

    if (!$kwallet->isEnabled()) {
        Purple::Debug::error("kwallet_password", "KWallet is not enabled.\n");
        return null;
    }

    if ($engine_data{handle} == 0 || !$kwallet->isOpen($engine_data{handle})) {
        my $kwallet_handle = 0;

        my $local_wallet_name = $kwallet->localWallet();
        $kwallet_handle = $kwallet->open($local_wallet_name, 1, $application_name);

        if ($kwallet_handle == 0) {
            Purple::Debug::error("kwallet_password", "Cannot open the default wallet $local_wallet_name.\n");
            return null;
        }

        $engine_data{handle} = $kwallet_handle;
    }

    return $engine_data{handle};
}

sub disconnect_from_kwallet {
    my $kwallet = get_kwallet_dbus_handle();

    if ($kwallet == null) {
        return;
    }
    $kwallet->disconnectApplication($kwallet->localWallet(), $application_name);

    if ($engine_data{handle} != 0 && $kwallet->isOpen($engine_data{handle})) {
        $kwallet->close($engine_data{handle}, false, $application_name);
    }

    $engine_data{dbus_object} = null;
    $engine_data{handle} = 0;

    Purple::Debug::info("kwallet_password", "Disconnected $application_name from KWallet.\n");
}

sub fetch_password {
    my $account = shift;

    my $key = Purple::Account::get_protocol_id($account) . ":" .
            Purple::Account::get_username($account);

    my $kwallet = get_kwallet_dbus_handle();
    if ($kwallet == null) {
        return;
    }

    if ($kwallet->folderDoesNotExist($kwallet->localWallet(), $folder)) {
        Purple::Debug::warning("kwallet_password", "Folder $folder does not exist, skipping password fetch for account $key.\n");
        return;
    }

    my $kwallet_handle = open_local_kwallet();
    if ($kwallet_handle == null) {
        return null;
    }

    my $password = $kwallet->readPassword($kwallet_handle, $folder, $key, $application_name);
    if ((not defined $password) || (length $password == 0)) {
        Purple::Debug::warning("kwallet_password", "Password for account $key is empty.\n");
    }
    else {
        Purple::Debug::info("kwallet_password", "Setting password for account $key from KWallet.\n");
        Purple::Account::set_password($account, $password);
    }
    undef $password;
}

sub store_password {
    my $account = shift;

    my $key = Purple::Account::get_protocol_id($account) . ":" .
            Purple::Account::get_username($account);
    if (length Purple::Account::get_password($account) == 0) {
        Purple::Debug::warning("kwallet_password", "Password for account $key is empty, not storing in KWallet.\n");
        return;
    }

    my $kwallet = get_kwallet_dbus_handle();
    if ($kwallet == null) {
        return;
    }

    my $kwallet_handle = open_local_kwallet();
    if ($kwallet_handle == null) {
        return null;
    }

    if ($kwallet->folderDoesNotExist($kwallet->localWallet(), $folder)) {
        if (!$kwallet->createFolder($kwallet_handle, $folder, $application_name)) {
            Purple::Debug::error("kwallet_password", "Could not create folder $folder.\n");
            return;
        }
    }
    if ($kwallet->writePassword($kwallet_handle, $folder, $key, Purple::Account::get_password($account), $application_name) > 0) {
        Purple::Debug::error("kwallet_password", "Could not write password for account $key.\n");
    }
}

sub on_account_connecting {
    my $account = shift;
    store_password($account);
}

sub plugin_load {
    my $plugin = shift;
    foreach $account (Purple::Accounts::get_all()) {
        fetch_password($account);
    }
    $accounts_handle = Purple::Accounts::get_handle();
    Purple::Signal::connect($accounts_handle, "account-connecting", $plugin, \&on_account_connecting, null);
}

sub plugin_unload {
    my $plugin = shift;
    foreach $account (Purple::Accounts::get_all()) {
        store_password($account);
    }

    disconnect_from_kwallet();
}
