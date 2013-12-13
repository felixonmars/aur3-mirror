# Maintainer: Simon Chabot <simon.chabot (at) chabotsi.fr>
pkgname=seafile-applet-git
_gitname=seafile-client
pkgver=v2.0.8.r15.g22abed3
pkgrel=1
pkgdesc="New version of Seafile desktop client (applet)"
arch=('any')
url="https://github.com/haiwen/seafile-client"
license=('Apache license')
depends=('qt4' 'libsearpc' 'seafile-shared>=2.0.5' 'jansson' 'sqlite' 
         'openssl')
makedepends=('git' 'cmake')
provides=('seafile-applet')
source=('git://github.com/haiwen/seafile-client')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  cmake .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  make clean
}

# vim:set ts=2 sw=2 et:
