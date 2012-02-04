# Maintainer: Saurav Modak <srvmdk at gmail dot com>
pkgname=iok
pkgver=1.3.13
pkgrel=1
pkgdesc="Indic Onscreen Keyboard"
arch=('x86_64' 'i686')
url="https://fedorahosted.org/iok/"
license=('GPL')
depends=('atk>=1.12.4' 'glibc>=2.4' 'gdk-pixbuf2>=2.22.0' 'glib2>=2.16.0' 'gtk2>=2.22.0' 'libunique>=1.0.0' 'libx11' 'libxml2>=2.7.4', 'libxtst')
source=("https://fedorahosted.org/releases/i/o/iok/$pkgname-$pkgver.tar.gz")
md5sums=('14e034d41806321ce9671554b13066dc')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
