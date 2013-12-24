#Maintainer; Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=gcc-lua-cdecl
pkgver=1.2.0
pkgrel=1
pkgdesc='C declaration composer for the GCC Lua plugin'
arch=('i686' 'x86_64')
url='http://colberg.org/gcc-lua-cdecl/'
license=('MIT')
depends=('gcc-lua' 'luajit') 
makedepends=('git' 'pandoc')
source=(git+http://git.colberg.org/gcc-lua-cdecl#tag=$pkgver)
md5sums=('SKIP')

build() {
  cd $pkgname
  make GCCLUA=gcclua
}

check() {
  cd $pkgname
  make GCCLUA=gcclua test
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
