# Maintainer: Jon Sturm <Jasturm002@aol.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

pkgname=tilp2
pkgver=1.16
pkgrel=1
pkgdesc="TI graphing calculator link/transfer program"
arch=(i686 x86_64)
url="http://lpg.ticalc.org/prj_tilp/"
license=('GPL')
depends=('libglade' 'libticalcs')
source=("http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.16/${pkgname}-${pkgver}.tar.bz2"
        tilp.desktop
        tilp.xml)
install=(tilp.install)


build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  #KDE users can remove the --without-kde option to enable native kde file dialogs
  ./configure --prefix=/usr --without-kde 
  make
  make DESTDIR="$pkgdir/" install

  install -m755 -d ${pkgdir}/usr/share/applications
  install -m644 ${srcdir}/tilp.desktop ${pkgdir}/usr/share/applications

  install -m755 -d ${pkgdir}/usr/share/mime/packages
  install -m644 ${srcdir}/tilp.xml ${pkgdir}/usr/share/mime/packages

}

md5sums=('eaea086a5041bb970977de7e65fd9bfa'
         'e2bb0d7ff6c3b0e60ff82213480f6d15'
         '0303100e8ccf1c92977a68f533af0887')
