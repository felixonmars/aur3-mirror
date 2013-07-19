# Maintainer: David Serrano <david.nonamedguy@gmail.com>
pkgname=httpipe-git
pkgver="0.0.1"
pkgrel=2
pkgdesc="Pipe data into HTTP"
arch=('x86_64 i686 armv6h')
url="https://github.com/N0NamedGuy/httpipe"
license=('MIT')
depends=('glibc')
makedepends=('git')
source=("git://github.com/N0NamedGuy/httpipe.git")
md5sums=('SKIP')

_gitname=httpipe

build() {
  cd $_gitname/src
  make 
}

package() {
  cd $_gitname/src
  mkdir -p $pkgdir/usr/bin
  make BINDIR="$pkgdir/usr/bin/" install

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/$_gitname/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
