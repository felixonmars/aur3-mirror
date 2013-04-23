# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=subgit-git
_gitname='subgit'
pkgver=ee60bf4
pkgrel=1
pkgdesc="Git subrepos done right"
arch=('any')
depends=('git')
makedepends=('git')
url="https://github.com/atweiden/subgit"
license=('Apache')
source=('git://github.com/atweiden/subgit.git')
sha256sums=('SKIP')
provides=('subgit')
conflicts=('subgit')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $_gitname
  install -D -m755 subgit "${pkgdir}/usr/bin/subgit"
}
