# Maintainer: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: AdriÃ¡n Chaves FernÃ¡ndez (Gallaecio) <adriyetichaves@gmail.com>

pkgname=0ad
pkgver=alpha_4
_pkgver=r09049-alpha
pkgrel=1
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game"
arch=('i686' 'x86_64')
url="http://wildfiregames.com/0ad"
license=('GPL2' 'CCPL')
depends=('binutils' 'boost' 'crypto++' 'curl' 'devil' 'enet-old' 'fam' 'libogg' 'libpng' 'libvorbis' 'libxml2' 'mesa' 'nasm' 'openal' 'python' 'sdl' 'wxgtk' 'zip' 'zlib')
makedepends=('cmake')
conflicts=('0ad-svn' '0ad-ppa-wfg')
provides=('0ad')
source=("http://releases.wildfiregames.com/$pkgname-$_pkgver-unix-build.tar.xz"
	"http://releases.wildfiregames.com/$pkgname-$_pkgver-unix-data.tar.xz"
	"${pkgname}.sh"
	"${pkgname}.desktop"
	"${pkgname}-editor.sh"
	"${pkgname}-editor.desktop"
	"${pkgname}.png"
	"${pkgname}.install")
md5sums=('3ebb1b322cd947c855da75828ebcd539'
         '30c289cdbffd552cc29e62778cd718d4'
         '0a8abdb0fc32af6d48ea235c46be5b7c'
         '52a54a776cb55237810295f47772d6ed'
         '1a54a2b4ab72424d14ffc42a01925ff3'
         'd0ec0adc2cea51337103a31272cb4b32'
         '51559438e79c0eb8576b98213a5d92d1'
         '92575ff82bd29369b7b0ee0ce307b39e')

build(){
  cd "$srcdir/$pkgname-$_pkgver/build/workspaces"

  sed -i 's/unix_names = { "boost_signals-mt", "boost_filesystem-mt", "boost_system-mt" },/unix_names = { "boost_signals", "boost_filesystem", "boost_system" },/g' "${srcdir}/${pkgname}-${_pkgver}/build/premake/extern_libs.lua"

  ./update-workspaces.sh

  cd "$srcdir/$pkgname-$_pkgver/build/workspaces/gcc"

  make CONFIG=Release -j3
}

package(){  
  install -d ${pkgdir}/opt/${pkgname}
  cp -r ${srcdir}/${pkgname}-${_pkgver}/binaries/* ${pkgdir}/opt/${pkgname}
 
  # Removing useless stuff.
  # This might change between releases:
  rm -r ${pkgdir}/opt/${pkgname}/system/*r
  rm -r ${pkgdir}/opt/${pkgname}/system/*.a
  rm -r ${pkgdir}/opt/${pkgname}/system/*t
  rm -r ${pkgdir}/opt/${pkgname}/system/*debug.so

  install -D -m755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -D -m755 ${srcdir}/${pkgname}-editor.sh ${pkgdir}/usr/bin/${pkgname}-editor

  install -D -m 0644 "${srcdir}/${pkgname}.desktop"		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m 0644 "${srcdir}/${pkgname}-editor.desktop"	"${pkgdir}/usr/share/applications/${pkgname}-editor.desktop"
  install -D -m 0644 "${srcdir}/${pkgname}.png"			"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
