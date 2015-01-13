# Author: Mikito Takada <mikito.takada [at] gmail [dot] com>
# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so>
_npmname=minilog
_npmver=
_github_user=mixu
_github_name=minilog
pkgname="nodejs-${_npmname}-git"
pkgver=2.0.6
pkgrel=1
pkgdesc="Lightweight client & server-side logging with Stream-API backends"
arch=(any)
url="https://github.com/${_github_user}/${_github_name}"
license=('MIT')
depends=('nodejs')
provides=("nodejs-${_npmname}")
groups=('devel')
source=("$pkgname"::"git+https://github.com/${_github_user}/${_github_name}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//' | cut -f1-3 -d.
}

package() {
  cd "${srcdir}/${pkgname}"
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  npm install -g --prefix "${pkgdir}/usr" "${_github_user}/${_github_name}"
  install -D -m 644 "${srcdir}/${pkgname}/LICENCE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

# vim:set ts=2 sw=2 et:
