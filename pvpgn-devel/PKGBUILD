# Maintainer: Patrick Palka <patrick@parcs.ath.cx>
# Development: <http://closure.ath.cx/aur-dev>

_basepkgname=pvpgn
pkgname=$_basepkgname-devel
pkgver=199.r577
pkgrel=6
pkgdesc="a bnetd-based gaming network server emulation project"
arch=('i686' 'x86_64')
license=('GPL')
url="http://pvpgn.berlios.de/"
source=("http://download.berlios.de/$_basepkgname/$_basepkgname-$pkgver.tar.bz2"
        "http://download.berlios.de/$_basepkgname/$_basepkgname-support-1.3.tar.gz"
        "$pkgname.install"
        bnetd
        )
depend=(sudo)
makedepends=(cmake)
install="$pkgname.install"
backup=(
opt/pvpgn/etc/ad.conf
opt/pvpgn/etc/address_translation.conf
opt/pvpgn/etc/anongame_infos.conf
opt/pvpgn/etc/autoupdate.conf
opt/pvpgn/etc/bnalias.conf
opt/pvpgn/etc/bnban.conf
opt/pvpgn/etc/bnetd.conf
opt/pvpgn/etc/bnetd_default_user.cdb
opt/pvpgn/etc/bnetd_default_user.plain
opt/pvpgn/etc/bnhelp.conf
opt/pvpgn/etc/bnissue.txt
opt/pvpgn/etc/bnmaps.conf
opt/pvpgn/etc/bnmotd-csCZ.txt
opt/pvpgn/etc/bnmotd-deDE.txt
opt/pvpgn/etc/bnmotd-enUS.txt
opt/pvpgn/etc/bnmotd-esES.txt
opt/pvpgn/etc/bnmotd-frFR.txt
opt/pvpgn/etc/bnmotd-nlNL.txt
opt/pvpgn/etc/bnmotd-plPL.txt
opt/pvpgn/etc/bnmotd-ptBR.txt
opt/pvpgn/etc/bnmotd-ruRU.txt
opt/pvpgn/etc/bnmotd-zhCN.txt
opt/pvpgn/etc/bnmotd-zhTW.txt
opt/pvpgn/etc/bnxpcalc.conf
opt/pvpgn/etc/bnxplevel.conf
opt/pvpgn/etc/channel.conf
opt/pvpgn/etc/command_groups.conf
opt/pvpgn/etc/d2cs.conf
opt/pvpgn/etc/d2dbs.conf
opt/pvpgn/etc/d2server.ini
opt/pvpgn/etc/news.txt
opt/pvpgn/etc/realm.conf
opt/pvpgn/etc/sql_DB_layout2.conf
opt/pvpgn/etc/sql_DB_layout.conf
opt/pvpgn/etc/supportfile.conf
opt/pvpgn/etc/topics.conf
opt/pvpgn/etc/tournament.conf
opt/pvpgn/etc/versioncheck.conf
)
conflicts=(pvpgn pvpgn-server)

build() {

    cd "$_basepkgname-$pkgver"

    mkdir -p build && cd build

    cmake -D CMAKE_INSTALL_PREFIX="/opt/$_basepkgname" ..
    make

}

package() {

    cd "$_basepkgname-$pkgver/build"

    make DESTDIR="$pkgdir" install

    cd ..

    install -vDm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mkdir -p "$pkgdir/usr/bin" && cd "$pkgdir/usr/bin"
    ln -vs "../../opt/$_basepkgname/bin/"* .

    mkdir -p "$pkgdir/usr/sbin" && cd "$pkgdir/usr/sbin"
    ln -vs "../../opt/$_basepkgname/sbin/"* .

    mkdir -p "$pkgdir/usr/share/man/man1" && cd "$pkgdir/usr/share/man/man1"
    ln -vs "../../../../opt/$_basepkgname/share/man/"* .

    cd "$srcdir/$_basepkgname-support-1.3"
    for file in *; do
        install -vm644 "$file" "$pkgdir/opt/$_basepkgname/var/files"
    done

    install -vDm755 "$srcdir/bnetd" "$pkgdir/etc/rc.d/bnetd"

    for daemon in d2dbs d2cs bntrackd; do
        ln -vs bnetd "$pkgdir/etc/rc.d/$daemon"
    done

    #mkdir -p "$pkgdir/var/log" && cd "$pkgdir/var/log"
    #ln -vs "../../opt/pvpgn-devel/var/"{d2dbs,d2cs,bntrackd}.log .

}

md5sums=('39147e67b40a770bb05a56ed677971d3'
         'd7e65fc8fe36d202ad23589565a5a9b7'
         '7f8adb9838391506cd6718e6b06693e9'
         '214e397072b19e3748a28cbf11141437')
