# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=triceratops
pkgver=0.0.1
pkgrel=1
pkgdesc="Polyphonic synthesizer LV2 plugin"
arch=(i686 x86_64)
url="http://deliriumdecrypted.blogspot.com/"
license=('GPL')
groups=('lv2-plugins')
depends=('gtkmm' 'lv2core')
makedepends=('lv2-c++-tools')
provides=("lv2-$pkgname")
conflicts=("lv2-$pkgname")
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-v.$pkgver.tar.gz")
md5sums=('9ec568a90b160c5a6d8a38f5e6d8d31c')

build() {
  cd "$srcdir"

  # fix hardcoded lv2 path
  sed -i "s|getenv.*/\.|\"/usr/lib/|g" *.cpp

  make
}

package() {
  cd "$srcdir"
  make INSTALL_DIR="$pkgdir/usr/lib/lv2" install
}

# vim:set ts=2 sw=2 et:
