# 
# 

pkgname=perlqt
_srcname=PerlQt
pkgver=3.008
pkgrel=3
pkgdesc="PerlQt allows use of the Qt toolkit from Perl."
arch=('i686' 'x86_64')
url="http://perlqt.sourceforge.net"
license=('GPL')
depends=('perl>=5.6' 'qt>=3.0')
options=('!libtool')
install=
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$_srcname-$pkgver/$_srcname-$pkgver.tar.gz)
md5sums=('a0cdc0c86b3e79c56f09f2af8c4c2c39')

build() {
  cd $srcdir/$_srcname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir/ install
}
