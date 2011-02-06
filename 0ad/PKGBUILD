# Maintainer: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: Adrián Chaves Fernández (Gallaecio) <adriyetichaves@gmail.com>

pkgname=0ad
pkgver=alpha_3
_pkgver=r08832-alpha
pkgrel=1
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game"
arch=('i686' 'x86_64')
url="http://wildfiregames.com/0ad"
license=('GPL2' 'CCPL')
depends=('binutils' 'boost' 'crypto++' 'devil' 'enet-old' 'fam' 'libogg' 'libpng' 'libvorbis' 'libxml2' 'mesa' 'nasm' 'openal' 'python' 'sdl' 'wxgtk' 'zip' 'zlib')
makedepends=('cmake')
conflicts=('0ad-svn' '0ad-ppa-wfg')
provides=('0ad')
source=("http://releases.wildfiregames.com/$pkgname-$_pkgver-unix-build.tar.xz"
	"http://releases.wildfiregames.com/$pkgname-$_pkgver-unix-data.tar.xz"
	"${pkgname}.install"
	"${pkgname}.sh"
	"${pkgname}-editor.sh"
	"${pkgname}.desktop"
	"${pkgname}-editor.desktop"
	"${pkgname}.png")
md5sums=('b9df52751596633d9aab4cc3b253cb82'
         '38abc29fc714946ed17ac86ac67fb614'
         '92575ff82bd29369b7b0ee0ce307b39e'
         '0a8abdb0fc32af6d48ea235c46be5b7c'
         '1a54a2b4ab72424d14ffc42a01925ff3'
         'e56b164613ab929fbce76c83b766c6e9'
         '51f83e2fd2f22764dbf775689aa155a4'
         '51559438e79c0eb8576b98213a5d92d1')

build(){
  cd "${srcdir}/${pkgname}-${_pkgver}/build/workspaces"
  ./update-workspaces.sh

  cd ${srcdir}/${pkgname}-${_pkgver}/build/workspaces/gcc

  # Official recomendations about -j parameter.
  if [[ $CARCH = 'x86_64' ]]
    then
      CONFIG=Release make -j3
    else
      CONFIG=Release make -j2
  fi
}

package(){  
  install -d ${pkgdir}/opt/0ad
  cp -r ${srcdir}/${pkgname}-${_pkgver}/binaries/* ${pkgdir}/opt/0ad
 
  # Removing useless stuff.
  # This might change between releases:
  rm -r ${pkgdir}/opt/0ad/system/*r
  rm -r ${pkgdir}/opt/0ad/system/*.a
  rm -r ${pkgdir}/opt/0ad/system/*t
  rm -r ${pkgdir}/opt/0ad/system/*debug.so

  install -D -m755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -D -m755 ${srcdir}/${pkgname}-editor.sh ${pkgdir}/usr/bin/${pkgname}-editor

  install -D -m 0644 "${srcdir}/${pkgname}.desktop"		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m 0644 "${srcdir}/${pkgname}-editor.desktop"	"${pkgdir}/usr/share/applications/${pkgname}-editor.desktop"
  install -D -m 0644 "${srcdir}/${pkgname}.png"			"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}