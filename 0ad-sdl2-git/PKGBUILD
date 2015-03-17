# Maintainer: Larry Reaves <larry@yrral.net>
# Based on 0ad-git, Maintainer: Joop Kiefte <ikojba@gmail.com>
pkgname=0ad-sdl2-git
_pkgname=0ad
pkgver=20150316
[ "1" = "1" ] && pkgver=`date +"%Y%m%d"`
pkgrel=5
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game"
arch=('i686' 'x86_64')
url="http://play0ad.com/"
license=('GPL2' 'CCPL')
depends=('binutils' 'boost-libs' 'curl' 'enet' 'libogg' 'libpng' 'libvorbis' 'libxml2' 'openal' 'sdl2' 'wxgtk' 'zlib' 'libgl' 'glu' 'gloox' 'miniupnpc' 'libsm')
makedepends=('boost' 'cmake' 'mesa' 'zip' 'python2')
source=("git://github.com/0ad/0ad.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/${_pkgname}/build/workspaces"

  unset CPPFLAGS # for le spidermonkey

  ./update-workspaces.sh \
      --bindir=/usr/bin \
      --libdir=/usr/lib/${pkgname} \
      --datadir=/usr/share/${pkgname}/data \
      --sdl2

  cd "$srcdir/${_pkgname}/build/workspaces/gcc"

  make # CONFIG=debug ## Uncoment this to build a debug release
}

package() {
  install -d "${pkgdir}"/usr/{bin,lib/${pkgname}}
  install -Dm755 "${srcdir}"/${_pkgname}/binaries/system/pyrogenesis "${pkgdir}/usr/bin/pyrogenesis-git"
  install -Dm755 "${srcdir}"/${_pkgname}/binaries/system/*.so "${pkgdir}/usr/lib/${pkgname}"

  install -Dm755 "${srcdir}/${_pkgname}/build/resources/${_pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  sed -i "s/which pyrogenesis/which pyrogenesis-git/" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/build/resources/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i "s/0ad/0ad-sdl2-git/" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}/build/resources/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  msg "Copy 0ad-data for packaging"
  install -d ${pkgdir}/usr/share/${pkgname}/data

  cp -r ${srcdir}/${_pkgname}/binaries/data ${pkgdir}/usr/share/${pkgname}
  msg "Done copying 0ad-data"
}
