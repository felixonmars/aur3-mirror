# Contributor: Nezmer <Nezmer@gmail.com>
# Thanks to judfilm for making the build process more professional

pkgname=videocut
pkgver=0.2.0
pkgrel=3
pkgdesc="An open-source desktop application specialized for creating compositions of screenshots from video files"
url="http://code.google.com/p/videocut/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('qt' 'xine-lib')
makedepends=('pkgconfig' 'qt')
source=(http://videocut.googlecode.com/files/${pkgname}_${pkgver}.tar.gz 
	fileformat.patch)
md5sums=('470effa63836545391d6ff08c7e6e40e'
         'ec42eb7141958f5bd63f3f8f2c6bb477')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}.orig
  patch -p0 <${srcdir}/fileformat.patch || return 1
  qmake || return 2
  make || return 3
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/share/icons
  install -D -m755 build/result/videocut ${pkgdir}/usr/bin
  install -D -m644 videocut.desktop ${pkgdir}/usr/share/applications/videocut.desktop
  install -D -m644 videocut.svg ${pkgdir}/usr/share/icons/videocut.svg
}


