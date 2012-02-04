# Maintainer: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: AdriÃ¡n Chaves FernÃ¡ndez (Gallaecio) <adriyetichaves@gmail.com>

pkgname=0ad
pkgver=alpha_8
_pkgver=r10803-alpha
pkgrel=1
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game"
arch=('i686' 'x86_64')
url="http://wildfiregames.com/0ad"
license=('GPL2' 'CCPL')
depends=('binutils' 'boost-libs' 'curl' 'enet>=1.3' 'gamin' 'libogg' 'libpng' 'libvorbis' 'libxml2' 'openal' 'openexr' 'python2' 'sdl' 'wxgtk' 'zip' 'zlib')
makedepends=('boost' 'cmake')
conflicts=('0ad-svn' '0ad-ppa-wfg')
provides=('0ad')
source=("http://releases.wildfiregames.com/$pkgname-$_pkgver-unix-build.tar.xz"
	"http://releases.wildfiregames.com/$pkgname-$_pkgver-unix-data.tar.xz"
	"${pkgname}.sh"
	"${pkgname}.install")
sha256sums=('fbf91d8482267384f8fb3fdd8a71e79ed71d73489c531f814fca70840043b928'
            'cb4d2b4c4ce1eadff4d34127664a6de02f9b062007275507d80d9ee6ebbae7d9'
            '08ebf47a4a977bac8a50a161c47cfeb199023f7f907858798f12b15a514b0053'
            'e0e79e936447e2d1833f423aae3323eac6da74cb23519be98b3de2753f0cac60')

build(){
  cd "$srcdir/$pkgname-$_pkgver/build/workspaces"

  sed -i 's/unix_names = { "boost_signals-mt", "boost_filesystem-mt", "boost_system-mt" },/unix_names = { "boost_signals", "boost_filesystem", "boost_system" },/g' "${srcdir}/${pkgname}-${_pkgver}/build/premake/extern_libs4.lua"

  ./update-workspaces.sh --with-system-enet

  cd "$srcdir/$pkgname-$_pkgver/build/workspaces/gcc"

  make CONFIG=Release
}

package(){
  install -d ${pkgdir}/opt/${pkgname}
  cp -r ${srcdir}/${pkgname}-${_pkgver}/binaries/* ${pkgdir}/opt/${pkgname}

  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -D -m 0644 "${srcdir}/$pkgname-$_pkgver/build/resources/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m 0644 "${srcdir}/$pkgname-$_pkgver/build/resources/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
