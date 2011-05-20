# Maintainer: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: AdriÃ¡n Chaves FernÃ¡ndez (Gallaecio) <adriyetichaves@gmail.com>

pkgname=0ad
pkgver=alpha_5
_pkgver=r09530-alpha
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
sha256sums=('4cbad45b085b412b48c4f3e27e8d808ff64d51d3ae479fd2ac108768af6a5336'
            '646f79b17f92872ff9a67d80ee5702d07219f8b3e3c91b438ce79fac2c33ed14'
            'd7ea528d1adc97021a6804c46f31925e299f9978325fe3cc2af2980ba295b95b'
            'c0d3b95acfe321aad11d72d68418412817fb05fcb186f94be51cccd49a1f3ebb'
            '06ec2bdf186d8f3aa445e394c32d444e948fd773f15431b19970ea8c2496ffaa'
            '5ba93f9f0dcc24f4b05f77ab4b2f585c51c67156568d7255c72ba3d765b2fdc9'
            '76923e3c1a83e24a173ce7ed79b6992467843d6b25a4a3df680fe7ad8e50e8f0'
            'e0e79e936447e2d1833f423aae3323eac6da74cb23519be98b3de2753f0cac60')

build(){
  cd "$srcdir/$pkgname-$_pkgver/build/workspaces"

  sed -i 's/unix_names = { "boost_signals-mt", "boost_filesystem-mt", "boost_system-mt" },/unix_names = { "boost_signals", "boost_filesystem", "boost_system" },/g' "${srcdir}/${pkgname}-${_pkgver}/build/premake/extern_libs.lua"

  ./update-workspaces.sh

  cd "$srcdir/$pkgname-$_pkgver/build/workspaces/gcc"

  make CONFIG=Debug
  #make CONFIG=Release -j3
}

package(){  
  install -d ${pkgdir}/opt/${pkgname}
  cp -r ${srcdir}/${pkgname}-${_pkgver}/binaries/* ${pkgdir}/opt/${pkgname}
 
  # Removing useless stuff.
  # This might change between releases:
  #rm -r ${pkgdir}/opt/${pkgname}/system/*r
  #rm -r ${pkgdir}/opt/${pkgname}/system/*.a
  #rm -r ${pkgdir}/opt/${pkgname}/system/*t
  #rm -r ${pkgdir}/opt/${pkgname}/system/*debug.so

  install -D -m755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -D -m755 ${srcdir}/${pkgname}-editor.sh ${pkgdir}/usr/bin/${pkgname}-editor

  install -D -m 0644 "${srcdir}/${pkgname}.desktop"		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m 0644 "${srcdir}/${pkgname}-editor.desktop"	"${pkgdir}/usr/share/applications/${pkgname}-editor.desktop"
  install -D -m 0644 "${srcdir}/${pkgname}.png"			"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
