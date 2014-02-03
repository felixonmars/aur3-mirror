# Maintainer: Stephane Sezer <sas@cd80.net>

_pkgname='hkd'
pkgname="${_pkgname}-git"
pkgver=r14.f1c5916
pkgrel=1
pkgdesc='Handle keyboard hot keys independantly of X.'
arch=('any')
_url="github.com/sas/${_pkgname}"
url="https://${_url}"
license=('BSD')
depends=('')
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
  install -d "${pkgdir}/etc"
  install -d "${pkgdir}/usr/lib/systemd/system"
  install -t "${pkgdir}/etc" assets/hkd.conf
  install -t "${pkgdir}/usr/lib/systemd/system" assets/hkd.service
}
