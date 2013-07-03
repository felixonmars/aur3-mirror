# Submitter: Benjamin van der Burgh <benjaminvdb@gmail.com>

pkgname=verilator-git
pkgver=1447.1baa2a2
pkgrel=1
pkgdesc="A fast simulator for synthesizeable Verilog"
arch=('i686' 'x86_64')
url="http://www.veripool.org/wiki/verilator"
license=('GPL')
depends=('gcc-libs')
makedepends=('make' 'autoconf' 'gcc' 'flex' 'bison')
source=(git+http://git.veripool.org/git/verilator)
md5sums=('SKIP')

_gitname='verilator'

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${srcdir}/${_gitname}
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR=${pkgdir} install
}
