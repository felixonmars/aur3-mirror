# Contributor: zoulnix <http://goo.gl/HQaP>
# Contributor: giacomogiorgianni@gmail.com 

pkgname=opendis-cpp
pkgver=3.0
pkgrel=2
pkgdesc="An open source implementation of the distributed interactive simulation."
arch=('i686' 'x86_64')
url="http://open-dis.sourceforge.net/"
license=('BSD')
depends=('cppunit' 'hawknl>=1.68')
makedepends=('gcc' 'make' 'patch' 'pkg-config' 'premake3')
source=(http://sourceforge.net/projects/open-dis/files/open-dis/languages.zip \
	${pkgname}-gcc44.diff \
	${pkgname}-quickfix.diff \
	${pkgname}-premake.diff)
md5sums=('0df8dfe1ad6a9446b058953bca1b8214' 'cb9e47c8af4b454d79ec3bdd54989115' \
	 '0094103c1ea5c135c76b4a2600854a7e' '51e836c59683dfa3af0b74a5749ffd9e')

build() {
  cd ${srcdir}/open-dis-/src/cpp

  # apply patches...
  patch -Np1 -i ${startdir}/${pkgname}-gcc44.diff || return 1
  patch -Np1 -i ${startdir}/${pkgname}-quickfix.diff || return 1
  patch -Np1 -i ${startdir}/${pkgname}-premake.diff || return 1

  # Generating build system
  cd ${srcdir}/open-dis-${pkgver}/Compile/premake
  ./premake_gnumake_linux.sh || return 1
  cd ../gnu

  make CONFIG=Release || return 1
}

package() {
  cd ${srcdir}/open-dis-/src/cpp
  install -d ${pkgdir}/usr/{bin,lib,include/DIS} || return 1

  install -m644 bin/libDIS.so ${pkgdir}/usr/lib/ || return 1
  install -m644 bin/{Example,UnitTest}* ${pkgdir}/usr/bin/ || return 1
  install -m644 */DIS/*.h ${pkgdir}/usr/include/DIS/ || return 1  
}
