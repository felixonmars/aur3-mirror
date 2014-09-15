# Maintainer: m-wynn <m-wynn at live dot com>

_pkgname=nemo-repairer
pkgname=nemo-filename-repairer-git
pkgver=145.0b83ed6
pkgrel=1
pkgdesc="Nemo filename repairer extension"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL')
source=(git+https://github.com/linuxmint/nemo-extensions.git)
depends=('nemo')
makedepends=('git')
conflicts=("${_pkgname}")

pkgver() { 
  cd "$srcdir"/nemo-extensions
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}"/nemo-extensions/"${_pkgname}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}"/nemo-extensions/"${_pkgname}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('SKIP')
