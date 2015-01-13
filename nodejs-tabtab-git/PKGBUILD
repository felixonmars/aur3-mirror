# Author: Mikito Takada <mikito.takada [at] gmail [dot] com>
# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so>
_npmname=tabtab
_npmver=
_github_user=mixu
_github_name=node-tabtab
pkgname="nodejs-${_npmname}-git"
pkgver=0.0.2
pkgrel=2
pkgdesc="An npm package to do some custom command line<tab><tab> completion for any system command, using the node api and JS to provide your own completion, for both bash/zsh shell."
arch=(any)
url="https://github.com/${_github_user}/${_github_name}"
license=('BSD')
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
  cd $srcdir
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  local _npmver="${pkgver}"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  npm install -g --prefix "$pkgdir/usr" "${_github_user}/${_github_name}"
  install -D -m 644 /usr/share/apps/LICENSES/BSD "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
