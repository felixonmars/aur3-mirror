#Maintainer: Juri Hamburg <juri@fail2fail.com>
_svntrunk=http://vlc-record.googlecode.com/svn/trunk
_svnmod=vlc-record-read-only
_application=vlc-record
pkgname=$_application-svn
pkgver=1281
pkgrel=1
pkgdesc="VLC-Record is a tool written in Qt / C++ to record / play streams from kartina.tv, Polsky.TV or other IPTV services using libVLC from the vlc media player"
arch=('i686' 'x86_64')
url="http://code.google.com/p/vlc-record/"
license=('GPLv3')
groups=()
depends=(qt vlc gdk-pixbuf2)
makedepends=(qt gcc make coreutils subversion)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
#source=(http://code.google.com/p/vlc-record/)
noextract=()
md5sums=()

pkgver() {
    cd "$srcdir/$_svnmod/$_application"
    local ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
    cd "$srcdir"
    svn co $_svntrunk $_svnmod
    cd "$srcdir/$_svnmod/$_application"
    $(which qmake) $_application.pro
    make release
}

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/applications
    cd "$srcdir/$_svnmod/$_application"
    make TARGET=$pkgdir/usr PROG=$_application -f install.mak instnew
}
