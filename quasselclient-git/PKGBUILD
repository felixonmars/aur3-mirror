# Contributor: Teo Mrnjavac <teo.mrnjavac@gmail.com>
# Contributor: Edward Toroshchin <edward.hades gmail com>
pkgname='quasselclient-git'
pkgver=20100508
pkgrel=1
pkgdesc="A Qt4 IRC client with a separated core"
url="http://quassel-irc.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt')
makedepends=('git' 'cmake')
provides=('quassel')
conflicts=('quassel')
source=()
md5sums=()

_gitroot="git://git.quassel-irc.org/quassel.git"
#_gitroot="git://gitorious.org/~nullren/quassel/nullrens-quassel.git"
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
    cmake -DWANT_CORE=OFF -DWANT_MONO=OFF -DWITH_OPENSSL=ON -DWITH_WEBKIT=OFF -DCMAKE_INSTALL_PREFIX=/usr . || return 1
    make || return 1

    make DESTDIR=$startdir/pkg/ install
}
