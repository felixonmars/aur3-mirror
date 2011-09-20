# Maintainer: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: AdriÃ¡n Chaves FernÃ¡ndez (Gallaecio) <adriyetichaves@gmail.com>

pkgname=0ad
pkgver=alpha_7
_pkgver=r10288-alpha
pkgrel=2
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game"
arch=('i686' 'x86_64')
url="http://wildfiregames.com/0ad"
license=('GPL2' 'CCPL')
depends=('binutils' 'boost-libs' 'curl' 'enet' 'fam' 'libogg' 'libpng' 'libvorbis' 'libxml2' 'mesa' 'openal' 'python2' 'sdl' 'wxgtk' 'zip' 'zlib')
makedepends=('boost' 'cmake')
conflicts=('0ad-svn' '0ad-ppa-wfg')
provides=('0ad')
source=("http://releases.wildfiregames.com/$pkgname-$_pkgver-unix-build.tar.xz"
	"http://releases.wildfiregames.com/$pkgname-$_pkgver-unix-data.tar.xz"
	"${pkgname}.sh"
	"${pkgname}.install")
sha256sums=('c18bd24932768389407db3b70fd6d17e574224b394d2ecfefa7d8ada676a7eef'
            'da6c5cb826db7a67992aa2c4f60a5d0238696241e3740c561ab5ff143b5bac02'
            '08ebf47a4a977bac8a50a161c47cfeb199023f7f907858798f12b15a514b0053'
            'e0e79e936447e2d1833f423aae3323eac6da74cb23519be98b3de2753f0cac60')

build(){
  cd "$srcdir/$pkgname-$_pkgver/build/workspaces"

  sed -i 's/unix_names = { "boost_signals-mt", "boost_filesystem-mt", "boost_system-mt" },/unix_names = { "boost_signals", "boost_filesystem", "boost_system" },/g' "${srcdir}/${pkgname}-${_pkgver}/build/premake/extern_libs.lua"

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
