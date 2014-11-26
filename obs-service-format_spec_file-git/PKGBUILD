# Maintainer: Carl Xiong <xiongc05@gmail.com>

_pkgname=obs-service-format_spec_file
pkgname=${_pkgname}-git
pkgver=r82.b7929d7
pkgrel=1
pkgdesc='An OBS source service: reformat SPEC file to SUSE standard. Git version.'
arch=('any')
url='https://github.com/openSUSE/obs-service-format_spec_file'
license=('GPL2')
depends=('obs-service-source_validator')
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
  mkdir -p "$pkgdir/usr/lib/obs/service/format_spec_file.files/"
  install -m755 format_spec_file "$pkgdir/usr/lib/obs/service/"
  install -m644 format_spec_file.service "$pkgdir/usr/lib/obs/service/"
  install -m755 prepare_spec patch_license \
	  "$pkgdir/usr/lib/obs/service/format_spec_file.files/"
  install -m644 licenses_changes.txt \
	  "$pkgdir/usr/lib/obs/service/format_spec_file.files/"
}
