# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Javeed Shaikh
pkgname=xmlwrapp  
pkgver=0.6.2
pkgrel=2
pkgdesc="C++ library for working with XML data."
url="https://github.com/vslavik/xmlwrapp"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sh' 'gcc-libs' 'libxslt>=1.1.6')
makedepends=('perl' 'libxml2>=2.4.28')
install=
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('8df3c3ae10a456ecfbd33125d02b9c0e')
options=('!libtool')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
