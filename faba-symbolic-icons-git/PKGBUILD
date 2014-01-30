pkgname=faba-symbolic-icons-git
_pkgname=faba-icon-theme-symbolic
pkgver=1.0.0
pkgrel=1
pkgdesc="The symbolic icon set for Faba."
arch=('any')
url="https://github.com/snwh/faba-icon-theme-symbolic"
license=('GPL3')
depends=(faba-icons-git)
makedepends=('git')
optdepends=()
provides=('faba-symbolic-icons-git')
conflicts=('faba-symbolic-icons-git')
source=('git+https://github.com/snwh/faba-icon-theme-symbolic.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Faba

  # install theme
  cd $srcdir/faba-icon-theme-symbolic/Faba
  cp -r . "$pkgdir"/usr/share/icons/Faba/
}
