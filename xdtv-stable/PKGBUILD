# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>

pkgname=xdtv-stable
_realname=xdtv
pkgver=2.4.0
pkgrel=1
pkgdesc="A software that allows you to watch and record TV"
url="http://xawdecode.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
conflicts=('xdtv')
provides=('xdtv')
install=xdtv.install
depends=('curl' 'faac' 'lame' 'libjpeg' 'libtheora' 'libvorbis' 'libxaw' 'libxinerama' \
         'libxv' 'libxxf86dga' 'libxxf86vm' 'lirc-utils' 'sdl' 'xvidcore' 'zvbi')
source=(${_realname}-${pkgver}.tar.gz::http://sourceforge.net/projects/xawdecode/files/01%20-%20XdTV/${pkgver}/${_realname}-${pkgver}.tar.gz/download \
        ${_realname}.desktop)
md5sums=('d654c0dcb8ab609c0bbf35d961759d48' \
         '073ae6f584a79f9eaf1236184ff155da')

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  ./configure --prefix=/usr \
              --with-fontdir=/usr/share/fonts/misc \
              --with-appdefaultsdir=/usr/lib/X11/app-defaults \
              --disable-x264 
  make
}

package() {
  cd ${srcdir}/${_realname}-${pkgver}
  make DESTDIR=${pkgdir} install
  
  # Remove unnecessary files
  rm -f ${pkgdir}/usr/share/fonts/misc/fonts.{dir,scale}
  
  # Move icons
  mkdir -p ${pkgdir}/usr/share/pixmaps
  mv ${pkgdir}/usr/share/xdtv/icons/* ${pkgdir}/usr/share/pixmaps
  rm -rf ${pkgdir}/usr/share/xdtv
  
  # Desktop File
  mkdir -p -m755 ${pkgdir}/usr/share/applications
  install -m644 ${srcdir}/${_realname}.desktop ${pkgdir}/usr/share/applications/
}
