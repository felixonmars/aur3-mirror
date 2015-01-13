# Author: Mikito Takada <mikito.takada [at] gmail [dot] com>
# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so>
_npmname=git-run
_npmver=
_github_user=mixu
_github_name=gr
pkgname="nodejs-${_npmname}-git"
pkgver=0.3.1
pkgrel=4
pkgdesc='A tool for managing multiple git repositories'
arch=(any)
url="https://github.com/${_github_user}/${_github_name}"
license=('BSD')
depends=('nodejs' 'nodejs-tabtab' 'nodejs-minilog')
provides=("nodejs-${_npmname}")
groups=('devel')
source=("$pkgname"::"git+https://github.com/${_github_user}/${_github_name}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//' | cut -f1-3 -d.
}

package() {
  cd "${srcdir}"
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  local _npmver="${pkgver}"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  npm install -g --prefix "${pkgdir}/usr" "${_github_user}/${_github_name}"
  install -D -m 644 /usr/share/apps/LICENSES/BSD "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
