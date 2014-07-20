# Maintainer: sxe <sxxe@gmx.de>
pkgname=kdestyle-kvantum-kde4
_origname=Kvantum
pkgver=0.2
pkgrel=1
pkgdesc="An SVG themeable style for Qt4 and KDE4."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Kvantum?content=166241"
license=("GPL")
depends=('qt4')
makedepends=()
conflicts=()
source=(http://kde-look.org/CONTENT/content-files/166241-$_origname-$pkgver.tar.xz)

md5sums=('405c9ecccfb1177fa4dee8c27f8add25')

build() {
  cd $srcdir/$_origname-$pkgver
  qmake-qt4
  make
}

package() {
  install -Dm0644 $srcdir/$_origname-$pkgver/style/libkvantum.so $pkgdir/usr/lib/qt4/plugins/styles/libkvantum.so
  install -Dm0644 $srcdir/$_origname-$pkgver/color/$_origname.colors $pkgdir/usr/share/apps/color-schemes/$_origname.colors
}