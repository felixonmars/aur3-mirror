# Maintainer: Jesse Jaara <gmail: jesse.jaara>

pkgname=euphoria3
pkgver=3.1.1
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Old series 3 version. A simple, flexible, and easy programming language."
url="http://www.rapideuphoria.com"
license="custom"

depends=('glibc')
makedepends=('upx')
depends_x86_64+=('lib32-glibc')
makedepends_x86_64+=('gcc-multilib')

source=(http://www.rapideuphoria.com/31/euphor31.tar 64bit_fix.patch)
install=euphoria.install
changelog=ChangeLog
options=(!strip)

build() {
  cd "${srcdir}/euphoria/source"
  export EUDIR="${srcdir}/euphoria"
  export PATH="${srcdir}/euphoria/bin:$PATH"

  if [ "$CARCH" = "x86_64" ]; then
	patch -p 2 -i ../../64bit_fix.patch
	sed 's|cc_name = "gcc"|cc_name = "gcc -m32"|g' -i c_decl.e  ## Fix ecu to add -m32 option to produced
	sed 's|gcc %s %s|gcc -m32 %s %s|g' -i c_decl.e		    ## makefile to compile on x86_64
	sed 's|./emake|sed "s/gcc/gcc -m32/g" -i emake\n./emake|g' -i buildu
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  fi

  sed 's|~/upx|upx|g' -i bmakeu
  sed 's|bin/ecu.a|lib/ecu.a|g' -i c_decl.e    ## Fix the lib dir
  mkdir ../lib && ln -s ../bin/ecu.a ../lib/ecu.a  
  ./buildu
}

package() {
  cd "${srcdir}/euphoria"

mkdir -p "${pkgdir}"/etc/profile.d
mkdir -p "${pkgdir}"/usr/{bin,lib,share/euphoria3/bin}
mkdir -p "${pkgdir}"/usr/share/licenses/euphoria3


cp	License.txt	"${pkgdir}/usr/share/licenses/$pkgname"
cp	bin/{ecu,exu}	"${pkgdir}/usr/bin/"
cp	bin/ecu.a	"${pkgdir}/usr/lib/"
cp	bin/{ascii,ed,eprint,guru,key,lines,search,where}{,.ex}	\
	bin/{backendu,bindu,cdguru,keywords.e,shroud,syncolor.e}\
			"${pkgdir}/usr/share/$pkgname/bin/"
cp -r	doc		"${pkgdir}/usr/share/$pkgname/"
cp -r	include		"${pkgdir}/usr/"
cp -r	demo		"${pkgdir}/usr/share/$pkgname/"
cp -r	html		"${pkgdir}/usr/share/$pkgname/"
cp -r	tutorial	"${pkgdir}/usr/share/$pkgname/"

echo "export EUDIR=/usr" >> "${pkgdir}/etc/profile.d/$pkgname.sh"
chmod +x "${pkgdir}/etc/profile.d/$pkgname.sh"
}

md5sums=('9bd3f2dd78561f36565ebd47cac7199d'
         'fd1a6e5ce1fee54c2eb4904c2c7c1340')
