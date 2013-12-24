#Maintainer; Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=gcc-lua
pkgver=1.2.0
pkgrel=1
pkgdesc='Lua plugin for the GNU Compiler Collection'
arch=('i686' 'x86_64')
url='http://colberg.org/gcc-lua/'
license=('MIT')
depends=('luajit') 
makedepends=('git' 'pandoc')
source=(git+http://git.colberg.org/gcc-lua#tag=$pkgver)
md5sums=('SKIP')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
