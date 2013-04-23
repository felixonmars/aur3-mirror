# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=subhg-git
_gitname='subhg'
pkgver=a3a46d0
pkgrel=1
pkgdesc="Mercurial subrepos done right"
arch=('any')
depends=('mercurial')
makedepends=('git')
url="https://github.com/atweiden/subhg"
license=('Apache')
source=(git://github.com/atweiden/subhg.git)
sha256sums=('SKIP')
provides=('subhg')
conflicts=('subhg')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $_gitname
  install -D -m755 subhg "${pkgdir}/usr/bin/subhg"
}
