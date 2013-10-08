# Maintainer: peace4all <markspost at rocketmail dot com>

pkgname=rhythmbox-screensaver-git
_gitname=screensaver
pkgver=96760ad
pkgrel=1
pkgdesc="Pause Rhythmbox when the GNOME screensaver is activated"
url="https://gist.github.com/2889332"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('rhythmbox>=2.9')
source=("$_gitname::git+https://gist.github.com/2889332.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "${srcdir}"

  #python fix
  sed -i -e "s|Loader=python|Loader=python3|" $(find . -name '*.plugin')

  mkdir -p "$pkgdir/usr/lib/rhythmbox/plugins/$_gitname"
  cp -R $_gitname/{*.py,*.plugin} "$pkgdir/usr/lib/rhythmbox/plugins/$_gitname/"
}
