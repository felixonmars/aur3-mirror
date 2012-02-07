# Maintainer: Iso <iso@krml.fr>

pkgname='less_app-hg'
pkgver=20120207
pkgrel=1
pkgdesc="Auto-compiler for LESS files"
arch=('any')
url="http://code.krml.fr/less.app"
license=('custom:WTFPL2')
depends=('lessc-git' 'inotify-tools')
makedepends=('mercurial')
provides=('less.app')

_hgroot='https://code.krml.fr'
_hgrepo='less.app'

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server..."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  cd "${srcdir}/${_hgrepo}"
  install -D -m755 less.app "${pkgdir}/usr/bin/less.app"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
