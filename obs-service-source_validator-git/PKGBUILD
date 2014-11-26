# Maintainer: Carl Xiong <xiongc05@gmail.com>

_pkgname=obs-service-source_validator
pkgname=${_pkgname}-git
pkgver=r70.94621cd
pkgrel=1
pkgdesc='An OBS source service: run all the osc source-validator checks. Git version.'
arch=('any')
url='https://github.com/openSUSE/obs-service-source_validator'
license=('GPL2')
depends=('libxml2' 'perl' 'perl-timedate')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git://github.com/openSUSE/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

package() {
  cd "$srcdir/${_pkgname}"

  mkdir -p "$pkgdir/usr/lib/obs/service/source_validators"
  install -m755 source_validator "$pkgdir/usr/lib/obs/service/"
  install -m644 source_validator.service "$pkgdir/usr/lib/obs/service/"
  cp -a [0-9]* helpers "$pkgdir/usr/lib/obs/service/source_validators/"
}

