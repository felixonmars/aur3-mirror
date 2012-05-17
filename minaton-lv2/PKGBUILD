# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=minaton-lv2
pkgver=0.0.3
pkgrel=1
pkgdesc="A music software synthesizer project, LV2 instrument."
arch=(i686 x86_64)
url="http://sourceforge.net/p/minaton/home/Home/"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2' 'jack' 'gtkmm')
makedepends=('lv2-c++-tools')
provides=('lv2-minaton')
conflicts=('lv2-minaton')
source=("http://downloads.sourceforge.net/project/minaton/$pkgname-v.$pkgver.tar.gz")
md5sums=('b5190a6c6942c1a1fe6b929963ad1f86')

build() {
  cd "$srcdir/$pkgname-v$pkgver"

  # set bundle_path
  sed -i "s|\(string bundle_path\);|\1 = \"/usr/lib/lv2/minaton.lv2/\";|" *.{hpp,h,cpp}

  make
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  make INSTALL_DIR="$pkgdir/usr/lib/lv2" install
}

# vim:set ts=2 sw=2 et:
