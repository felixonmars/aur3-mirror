# Maintainer: Stephane Sezer <sas@cd80.net>

_pkgname='blctl'
pkgname="${_pkgname}-git"
pkgver=r10.cbdae5e
pkgrel=1
pkgdesc='Control device backlight (screen, keyboard, etc).'
arch=('any')
_url="github.com/sas/${_pkgname}"
url="https://${_url}"
license=('BSD')
depends=()
makedepends=('git' 'ruby-ronn')
source=("repo::git://${_url}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/repo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "${srcdir}/repo"
  make all
}

package () {
  cd "${srcdir}/repo"
  make PREFIX="${pkgdir}/usr" install
}
