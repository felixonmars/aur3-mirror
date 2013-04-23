# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=wgetpkg-git
_gitname='wgetpkg'
pkgver=bbd6a3b
pkgrel=1
pkgdesc="Downloads AUR packages with wget"
arch=('any')
depends=('perl')
makedepends=('git')
url="https://github.com/atweiden/wgetpkg"
license=('Apache')
source=(git://github.com/atweiden/wgetpkg.git)
sha256sums=('SKIP')
provides=('wgetpkg')
conflicts=('wgetpkg')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $_gitname
  install -D -m755 wgetpkg.pl "${pkgdir}/usr/bin/wgetpkg"
}
