# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=video-clip-music-assist
pkgver=0.0.5
pkgrel=1
pkgdesc="Searches Jamendo for music of a certain duration."
arch=(i686 x86_64)
url="http://www.nongnu.org/vcma/"
license=('GPL')
depends=('gtkmm' 'gconfmm' 'libsoupmm-git' 'gstreamermm' 'hicolor-icon-theme')
install="$pkgname.install"
source=("http://download.savannah.gnu.org/releases/vcma/$pkgname-$pkgver.tar.gz")
md5sums=('68e9f77486db36088bbeb001fe22d7bd')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
