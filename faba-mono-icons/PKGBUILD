pkgname=faba-mono-icons
_pkgname=faba-mono-icons
pkgver=1.0.0
pkgrel=1
pkgdesc="The monochromatic panel icon sets for Faba."
arch=('any')
url="https://github.com/snwh/faba-mono-icons"
license=('GPL3')
depends=(faba-icons)
makedepends=('git')
optdepends=()
provides=('faba-mono-icons')
conflicts=('faba-mono-icons')
source=('git+https://github.com/snwh/faba-mono-icons.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Faba-Light/
  install -d -m 755 "$pkgdir"/usr/share/icons/Faba-Dark/

  # install theme
  cd $srcdir/faba-mono-icons/Faba-Light
  cp -r . "$pkgdir"/usr/share/icons/Faba-Light/
  cd $srcdir/faba-mono-icons/Faba-Dark
  cp -r . "$pkgdir"/usr/share/icons/Faba-Dark/
}
