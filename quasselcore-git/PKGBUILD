pkgname='quasselcore-git'
pkgver=20090318
pkgrel=2
pkgdesc="A Qt4 IRC client with a separated core - core only"
url="http://quassel-irc.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt')
makedepends=('git' 'cmake')
provides=('quasselcore')
conflicts=('quassel')
source=('quasselcore.rcscript')
md5sums=('d4e8e925e435639df382e222016fcc36')
backup=('etc/rc.d/quasselcore')

_gitroot="git://git.quassel-irc.org/quassel.git"
_gitname="quassel"

build() {
    cd $startdir/src

    msg "Connecting to the GIT server...."
    if [ -d $_gitname ]; then
    	(cd $_gitname && git pull origin || return 1)
    else
    	git clone $_gitroot || return 1
    fi

    rm -rf ${_gitname}-build
    cp -r $_gitname ${_gitname}-build
    cd ${_gitname}-build

    msg "Starting build process."
    cmake -DCMAKE_INSTALL_PREFIX=/usr . -DWANT_CORE=ON -DWANT_MONO=OFF -DWANT_QTCLIENT=OFF -DWITH_DBUS=OFF -DWITH_OXYGEN=OFF -DWITH_PHONON=OFF -DWITH_WEBKIT=OFF || return 1
    make || return 1

    make DESTDIR=$startdir/pkg/ install
    install -D $startdir/quasselcore.rcscript $pkgdir/etc/rc.d/quasselcore
}
