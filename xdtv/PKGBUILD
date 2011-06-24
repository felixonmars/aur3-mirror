# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>

pkgname=xdtv
pkgver=2.4.1cvs15
pkgrel=2
pkgdesc="A software that allows you to watch and record TV"
url="http://xawdecode.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
conflicts=('xdtv-stable')
install=xdtv.install
depends=('curl' 'faac' 'lame' 'libjpeg' 'libtheora' 'libvorbis' 'libxaw' 'libxinerama' \
         'libxv' 'libxxf86dga' 'libxxf86vm' 'lirc-utils' 'sdl' 'xvidcore' 'zvbi')
source=(${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/xawdecode/files/01%20-%20XdTV/${pkgver}%20%28Only%20to%20follow%20the%20FFmpeg%20updates%29/${pkgname}-${pkgver}.tar.gz/download \
        ${pkgname}.desktop)
md5sums=('890a6c98c904326be88d163cdf602018' \
         '073ae6f584a79f9eaf1236184ff155da')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --with-fontdir=/usr/share/fonts/misc \
              --with-appdefaultsdir=/usr/lib/X11/app-defaults \
              --disable-x264 
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  
  # Remove unnecessary files
  rm -f ${pkgdir}/usr/share/fonts/misc/fonts.{dir,scale}
  
  # Move icons
  mkdir -p ${pkgdir}/usr/share/pixmaps
  mv ${pkgdir}/usr/share/xdtv/icons/* ${pkgdir}/usr/share/pixmaps
  rm -rf ${pkgdir}/usr/share/xdtv
  
  # Desktop File
  mkdir -p -m755 ${pkgdir}/usr/share/applications
  install -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
}
