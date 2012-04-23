# Contributor: Josef Lusticky <evramp@gmail.com>
# Maintainer: Josef Lusticky <evramp@gmail.com>

pkgname=intel2gas
pkgver=1.3.3
pkgrel=3
pkgdesc="A converter that will convert assembler source files written for NASM to files that can be assembled using the GNU Assembler (GAS)"
arch=('i686' 'x86_64')
url="http://www.niksula.hut.fi/~mtiihone/intel2gas/"
license=('LGPL')
depends=('gcc-libs')
makedepends=('patch' 'gcc' 'make' 'glibc')
source=('http://www.niksula.cs.hut.fi/~mtiihone/intel2gas/intel2gas-1.3.3.tar.gz'
	'intel2gas_1.3.3-13-no-debian.diff')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  patch -p0 < ../intel2gas_1.3.3-13-no-debian.diff
  chmod 644 i2g/main.syntax

  ./configure --prefix=/usr
  make
  make prefix=${pkgdir}/usr install
}

md5sums=('40c85d961f6214903d80dc7f233a2c6f'
         'bee5382c27642b53f06f4e47332eafeb')
