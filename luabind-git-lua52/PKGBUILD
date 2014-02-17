# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Maintainer: Marco Pompili <marcs.pompili@gmail.com>
# Maintainer: Jakob Gruber <jakob.gruber@gmail.com>
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: rayte <rabyte.at.gmail.dot.com>

pkgname=luabind-git-lua52
pkgver=0.9.0
pkgrel=1
pkgdesc="A library that helps you create bindings between C++ and Lua"
arch=('i686' 'x86_64')
url="http://www.rasterbar.com/products/luabind.html"
license=('MIT')
makedepends=('unzip' 'boost' 'boost-build-nightly')
depends=('lua' 'gcc-libs')
source=(
        "luabind_boost.patch")

build() {
  cd ${srcdir}
  git clone git@github.com:luabind/luabind.git
  cd luabind
  git checkout 0.9

  patch -Np1 -i ${srcdir}/luabind_boost.patch

  # build luabind
  b2-nightly release --prefix=${pkgdir}/usr/ link=static,shared
}

package() {
  cd ${srcdir}
  cd luabind

  b2-nightly release --prefix=${pkgdir}/usr/ link=static,shared install

  # copy license
  install -Dm644 ${srcdir}/luabind/LICENSE \
      ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

md5sums=(
         'd62ae6fc635300bc659df9dbb587ac53')
