# Maintainer: revel <revelΘmuub·net>
# Original Contributor: Marcos J. S. Magalhaes <mjsmagalhaes ^dot^ insc _at_ gmail ~dot~ com>

pkgname=premake4
pkgver=4.3
pkgrel=1
pkgdesc="A build configuration tool. Describe your build using Lua and generate \
the project files for your specific toolset."
install=premake4.install
arch=('i686' 'x86_64')
url="http://industriousone.com/premake"
license=('BSD')
#provides=("premake4")
source=(http://downloads.sourceforge.net/project/premake/Premake/$pkgver/premake-$pkgver-src.zip
	)
md5sums=('8cfafee76f9665c93b2e9ad15b015eb7'
	)

build() {
  cd $srcdir/premake-$pkgver/build/gmake.unix
  make
}

package() {
#  mkdir --parents ${pkgdir}/usr/bin || return 1
  install -dm755 ${pkgdir}/usr/bin
  install -m755 $srcdir/premake-$pkgver/bin/release/premake4 ${pkgdir}/usr/bin
}
