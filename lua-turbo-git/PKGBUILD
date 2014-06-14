# Maintainer: John Regan <john@jrjrtech.com>
pkgname=lua-turbo-git
pkgver=0.0.0
pkgrel=1
_pkgbase=turbo
pkgdesc="Turbo is a framework built for LuaJIT 2 to simplify the task of building fast and scalable network applications."
url="http://github.com/kernelsauce/turbo"
license=("Apache")
arch=('i686' 'x86_64')
depends=('luajit=2.0.3' 'openssl')
makedepends=('git')
conflicts=('lua-turbo')
provides=('lua-turbo')
source=("git+https://github.com/kernelsauce/turbo.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgbase}"
  make PREFIX=/usr LUAJIT_VERSION=2.0.3
}

package() {
  cd "$srcdir/${_pkgbase}"
  make install PREFIX="${pkgdir}/usr" LUAJIT_VERSION=2.0.3
}
