# Maintainer: sxe <sxxe@gmx.de>
pkgname=kdestyle-kvantum-kde4-git
_origname=Kvantum
pkgver=e3099d5
pkgrel=1
pkgdesc="An SVG themeable style for Qt4 and KDE4."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Kvantum?content=166241"
license=("GPL")
depends=('qt4')
makedepends=('git')
conflicts=('kdestyle-kvantum-kde4')
source=('git://github.com/tsujan/Kvantum.git')
md5sums=('SKIP')

pkgver() {
  #date +%Y%m%d
  cd "$srcdir/${_origname}/${_origname}"
  git describe --always --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^wine.//'
}

build() {
  cd "$srcdir/${_origname}/${_origname}"
  qmake-qt4
  make
}

package() {
  install -Dm0644 $srcdir/${_origname}/${_origname}/style/libkvantum.so $pkgdir/usr/lib/qt4/plugins/styles/libkvantum.so
  install -Dm0644 $srcdir/${_origname}/${_origname}/color/$_origname.colors $pkgdir/usr/share/apps/color-schemes/$_origname.colors
}