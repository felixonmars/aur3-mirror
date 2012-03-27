#Maintainer: Stéphane Marguet (Stemp) <smarguet à gmail point com>

pkgname=gtk-v4l
pkgver=0.4
pkgrel=2
pkgdesc="Video4Linux Web Camera control application"
url="https://fedorahosted.org/gtk-v4l/"
changelog=ChangeLog
license=('GPL')
depends=('v4l-utils' 'gtk2')
arch=(i686 x86_64)
source=("https://fedorahosted.org/releases/g/t/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('9e7380d58830957661e38d59e3b0ad4d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}