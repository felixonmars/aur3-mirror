#!/bin/bash
ver=0.2.0
#
# Aurnotify, a tool to set notify status of favorite packages on AUR
# Feifei Jia <feifei.j@gmail.com>
#
# Special thanks to Joris Steyn.
#
# Based on Aurvote, written by <wain@archlinux.fr>
# https://aur.archlinux.org/packages.php?ID=9845
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#

TMPDIR="/tmp/aurnotify-tmp-$(id -un)$$"
CONFIGFILE=~/.aurnotify
CONFIGFILE_AURVOTE=~/.config/aurvote
AUR_BASE_URL="https://aur.archlinux.org/"

version() {
    echo "aurnotify - version $ver"
    echo
    exit 0
}

usage() {
    echo "aurnotify - version $ver"
    echo
    echo "usage: aurnotify <option> <pkgname1> <pkgname2> ..."
    echo
    echo "aurnotify --version,  -V     show version"
    echo "aurnotify --help,     -h     show this help"
    echo "aurnotify --notify,   -v     notify packages"
    echo "aurnotify --unnotify, -u     unnotify packages"
    echo "aurnotify --check,    -c     check notify status of packages"
    echo "aurnotify --password, -p     enter aur account name and password"
    echo
    echo " example: aurnotify --notify yaourt shake bfilter"
    echo
}

### MAIN PROGRAM ###
ACTION="notify"
PASSWORD="0"

while [ "$#" -ne "0" ]
do
    case $1 in
        --help|-h)
            usage
            exit 0
            ;;
        --version|-V) version
            ;;
        --check|-c) ACTION="check"
            ;;
        --notify|-v) ACTION="notify"
            ;;
        --unnotify|-u) ACTION="unnotify"
            ;;
        --password|-p) PASSWORD="1"
            ;;
        --*|-*)
            usage
            exit 0
            ;;
        *)
            pkgnames[${#pkgnames[@]}]=$1
            ;;
    esac
    shift
done

if [ "${#pkgnames[@]}" -eq 0 ]
then
    usage
    exit 0
fi

# Check config file
if [ "$PASSWORD" -eq 1 ]
then
    read -p "Please enter your aur account name: " user
    read -s -p "Please enter your aur account password: " pass
    echo
elif [ -r "$CONFIGFILE" ]
then
    source "$CONFIGFILE"
elif [ -r "$CONFIGFILE_AURVOTE" ]
then
    source "$CONFIGFILE_AURVOTE"
else
    echo "You have to create $CONFIGFILE with inside:"
    echo "user=YOUR_AUR_USERNAME"
    echo "pass=YOUR_AUR_PASS"
    echo
    echo "To create a new account just go to:"
    echo "https://aur.archlinux.org/account.php"
    echo
    echo "Or use \"-p\" switch to enter username and password manually"
    exit 1
fi

# Log into AUR
mkdir -p "$TMPDIR"

wget --quiet --keep-session-cookie --save-cookies "$TMPDIR/.aurnotify.cookies" \
--post-data="user=${user}&passwd=${pass}" $AUR_BASE_URL/login \
-O "$TMPDIR/aurnotify.login" || exit 1

if grep --quiet "'error'>Bad username or password" "$TMPDIR/aurnotify.login"
then
    echo "incorrect password: check "$CONFIGFILE" file or make sure you type the right password"
    exit 1
fi

# notify/unnotify/check for each package
for pkgname in ${pkgnames[@]}
do
    PKG_URL=$AUR_BASE_URL/packages/$pkgname

    if [ "$ACTION" = "check" ]
    then
        echo -n "$pkgname: "

        wget --quiet --load-cookies="$TMPDIR/.aurnotify.cookies" \
        $PKG_URL -O "$TMPDIR/$pkgname" || echo "ERROR: Can't access $PKG_URL"

        if grep -q "href=\"/packages/$pkgname/unnotify/\"" $TMPDIR/$pkgname
        then
            echo "already notified"
        elif grep -q "href=\"/packages/$pkgname/notify/\"" $TMPDIR/$pkgname
        then
            echo "not notified"
        else
            echo "notified status not found!"
        fi
    elif [ "$ACTION" = "notify" ]
    then
        if wget --quiet --load-cookies="$TMPDIR/.aurnotify.cookies" \
            $PKG_URL/notify -O "$TMPDIR/$pkgname"
        then
            echo "$pkgname now notified"
        else
            echo "ERROR: Can't access $PKG_URL/notify"
        fi
    elif [ "$ACTION" = "unnotify" ]
    then
        if wget --quiet --load-cookies="$TMPDIR/.aurnotify.cookies" \
            $PKG_URL/unnotify -O "$TMPDIR/$pkgname"
        then
            echo "$pkgname now unnotified"
        else
            echo "ERROR: Can't access $PKG_URL/unnotify"
        fi
    fi
done

rm -r ${TMPDIR}/
exit 0

