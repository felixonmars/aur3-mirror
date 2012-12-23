# Maintainer: Ansgar Taflinski <ataflinski@uni-koblenz.de>
pkgname=dktools-gui
pkgver=2.2.26
pkgrel=1
pkgdesc="This package contains the GUI applications based on some of the cli-tools provided by the dktools package."
arch=('i686' 'x86_64')
url="http://dktools.sourceforge.net"
license=('dktools-license')
depends=('dktools' 'java-runtime')
source=(http://sourceforge.net/projects/dktools/files/dktools/dktools-$pkgver/$pkgname-$pkgver.zip)
md5sums=('de735196ffae4f76fb43025ed0dbda6c')
  
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
} 
