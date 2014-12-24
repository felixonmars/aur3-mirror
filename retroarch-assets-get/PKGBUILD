# Maintainer: Thomas Schneider <maxmusterm@gmail.com>

pkgname=retroarch-assets-get
pkgver=23.926a999
pkgrel=1
pkgdesc="RetroArch assets"
arch=('any')
url="https://github.com/libretro/retroarch-assets.git"
license=('None')
depends=('retroarch')
makedepends=('git')

_gitname=retroarch-assets
source=('git+https://github.com/libretro/retroarch-assets.git')

md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitname}"
#  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  echo "Done"
}

package() {
  cd "$srcdir/${_gitname}"
  mkdir -p $pkgdir/usr/share/libretro/assets/
  mv lakka $pkgdir/usr/share/libretro/assets/
  mv rmenu $pkgdir/usr/share/libretro/assets/
}
