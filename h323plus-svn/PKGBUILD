# Maintainer: Dylan Ferris <dylan.ferris@gmail.com>

pkgname=h323plus-svn
pkgver=20100311
pkgrel=1
pkgdesc="H.323 is the leading protocol for videoconferencing, with virtually every videoconferencing solution in the world using H.323 in order to establish voice and video communications."
arch=('i686' 'x86_64')
url="http://www.h323plus.org/"
license=('MPL')
depends=('ptlib>=2.8')
#source=(http://www.h323plus.org/source/download/$pkgname-v$pkgver.tar.gz)
#md5sums=('370532e5754a092c9755930c4f1f6f61') #generate with 'makepkg -g'
makedepends=('cvs')
source=()
md5sums=()

_cvsmod=${pkgname%-*}
_cvsroot=":pserver:anonymous@h323plus.cvs.sourceforge.net:/cvsroot/${_cvsmod}"

build() {
    cd $startdir/src
    msg "Connecting to h323plus.cvs.sourceforge.net CVS server...."
    cvs -z3 -d $_cvsroot co -D $pkgver -P $_cvsmod
    msg "CVS checkout done or server timeout"
    msg "Starting make..."
    cd ./$_cvsmod
	
    ./configure --prefix=/usr PTLIBDIR=/usr/share/ptlib
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
