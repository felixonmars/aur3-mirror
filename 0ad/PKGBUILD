# Maintainer: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: AdriÃ¡n Chaves FernÃ¡ndez (Gallaecio) <adriyetichaves@gmail.com>

pkgname=0ad
pkgver=alpha_6
_pkgver=r09786-alpha
pkgrel=2
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game"
arch=('i686' 'x86_64')
url="http://wildfiregames.com/0ad"
license=('GPL2' 'CCPL')
depends=('binutils' 'boost-libs' 'crypto++' 'curl' 'devil' 'enet' 'fam' 'libogg' 'libpng' 'libvorbis' 'libxml2' 'mesa' 'nasm' 'openal' 'python' 'sdl' 'wxgtk' 'zip' 'zlib')
makedepends=('boost' 'cmake')
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
sha256sums=('d2b3b06d3396197de36b1ddce109b0d306a0d9a01b634b4aa1e669f44bddcffa'
            '5c55bd36a0096d61d410a549fe8e89875f236847cce137eb5a8e89f6a67e49af'
            '08ebf47a4a977bac8a50a161c47cfeb199023f7f907858798f12b15a514b0053'
            'c0d3b95acfe321aad11d72d68418412817fb05fcb186f94be51cccd49a1f3ebb'
            '6799b2353f2c101aeb099368337b0133817f9c1a6227d5407d60a4bc00068bc1'
            '5ba93f9f0dcc24f4b05f77ab4b2f585c51c67156568d7255c72ba3d765b2fdc9'
            '76923e3c1a83e24a173ce7ed79b6992467843d6b25a4a3df680fe7ad8e50e8f0'
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
 
  install -D -m755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -D -m755 ${srcdir}/${pkgname}-editor.sh ${pkgdir}/usr/bin/${pkgname}-editor

  install -D -m 0644 "${srcdir}/${pkgname}.desktop"		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m 0644 "${srcdir}/${pkgname}-editor.desktop"	"${pkgdir}/usr/share/applications/${pkgname}-editor.desktop"
  install -D -m 0644 "${srcdir}/${pkgname}.png"			"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
