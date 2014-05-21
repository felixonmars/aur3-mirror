# Original Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Maintainer: Alexander "butterbrot" Hausmann <alexander-hausmann@web.de>
# Contributor: Jakob "flocke" Nixdorf <flocke@user-helfen-usern.de>
# Maintainer: Johannes Altmanninger <j.altmanninger@gmx.net>

pkgname=0ad-svn
_pkgname=0ad
pkgver=20140520
pkgrel=3
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game"
arch=('i686' 'x86_64')
url="http://play0ad.com/"
license=('GPL2' 'CCPL')
depends=('binutils' 'boost-libs' 'curl' 'enet' 'libogg' 'libpng' 'libvorbis' 'libxml2' 'openal' 'sdl' 'wxgtk' 'zlib' 'libgl' 'glu' 'gloox' 'libsm')
makedepends=('subversion' 'boost' 'cmake' 'mesa' 'zip' 'python2')
###### clone directly into src/0ad to avoid copying the whole tree on each build
###### (see https://bugs.archlinux.org/task/35050 )
source=("src/$_pkgname::svn+http://svn.wildfiregames.com/public/ps/trunk")
noextract=("src/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/repo"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}
build() {
  cd "$srcdir"/$_pkgname/build/workspaces

  unset CPPFLAGS # for le spidermonkey

  ./clean-workspaces.sh
  ./update-workspaces.sh \
      --with-system-enet \
      --bindir=/usr/bin \
      --libdir=/usr/lib/${pkgname} \
      --datadir=/usr/share/${pkgname}/data
      #--with-system-miniupnpc

  cd "$srcdir/$_pkgname/build/workspaces/gcc"

  make clean
  make # CONFIG=debug ## Uncoment this to build a debug release
}

package() {
  install -d "${pkgdir}"/usr/{bin,lib/${pkgname}}
  install -Dm755 "${srcdir}"/$_pkgname/binaries/system/pyrogenesis "${pkgdir}/usr/bin/pyrogenesis-svn"
  install -Dm755 "${srcdir}"/$_pkgname/binaries/system/*.so{,.*} "${pkgdir}/usr/lib/${pkgname}"

  install -Dm755 "${srcdir}/$_pkgname/build/resources/${_pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  sed -i "s/which pyrogenesis/which pyrogenesis-svn/" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/$_pkgname/build/resources/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i "s/0ad/0ad-svn/" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/$_pkgname/build/resources/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  msg "Copy 0ad-data for packaging"
  install -d ${pkgdir}/usr/share/${pkgname}/data

  cp -r ${srcdir}/${_pkgname}/binaries/data ${pkgdir}/usr/share/${pkgname}
  msg "Done copying 0ad-data"
}
