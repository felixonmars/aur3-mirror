# Contributor: s.g <ilguido@users.sourceforge.net>

pkgname=fig2vect
pkgver=1.1.19
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Fig to svg converter"
url="http://fig2vect.sourceforge.net/"
license=('GPL')
depends=('dklibs')
optdepends=('netpbm: for certain file format conversions')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('783296340a5dacc1f83e81d397a40963')
backup=('etc/$pkgname/appdefaults')
options=('!emptydirs')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc/$pkgname \
    --mandir=/usr/share/man || return 1
  make || return 1 
  make pp=$pkgdir install || return 1
}

