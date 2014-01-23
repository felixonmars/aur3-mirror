# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: János Illés <ijanos@gmail.com>

pkgname=umtsmon
pkgver=0.10alpha
pkgrel=12
pkgdesc="A tool to manage your UMTS (3G) card/device (send sms, modify pin, monitor traffic)"
url="http://umtsmon.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt3' 'ppp' 'libusb' 'libusb-compat')
optdepends=('gksu: umtsmon will complain if gksu is missing, but works fine after ignoring the error message'
            'usb_modeswitch: devices with ZeroCD functionality may need this to get working'
            'polymer: nice looking QT3 theme without KDE dependencies')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.src.tar.gz
        umtsmon-0.9-unistd.patch
	umtsmon-0.9-sys-stat.patch)
sha512sums=('d8b146372f8c9607f8d35e57907647d69d951f0ba5e7ce9d492df67cae13f82ca3fba8a805f8d66eca5eed2edab3d6a33a25d9bf514191b44dd1130d7d109f97'
	    '41fe9fdcd5d97bd26980c9b4ca65c018e6cc7148cc2ebc34a85923ede999205e50736575a2e8d306705dd91b745e5f3619f3ad37d4513a7bb57c65e1eebdb41a'
	    '0a900f79634bb7f955218747e57f7626897b3660c2e4d2b8a4961080a3346beafeb8681c6fee440373d66c43883b5bcd6fa1de093690d81fa6c5b88fb57c48cf')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  msg "Patching..."
  for i in $srcdir/*.patch; do
    patch -Np1 -i "$i"
  done
  # sry for the dirty fixes, but don't know better :(
  sed -i '/INCLUDEPATH/s/$/ \/usr\/include\/qt3/g' umtsmon.pro
  sed -i '7iQMAKE_UIC = \/usr\/bin\/uic-qt3' umtsmon.pro
  sed -i '7iQMAKE_QMAKE = \/usr\/bin\/qmake-qt3' umtsmon.pro
  sed -i '/^CONFIG/s/$/ uic3/g' umtsmon.pro
  sed -i '/^CONFIG/s/qt/qt3/g' umtsmon.pro
  sed -i 's/lupdate -verbose/lupdate-qt3 -verbose/g' umtsmon.pro
  sed -i 's/lrelease -verbose/lrelease-qt3 -verbose/g' umtsmon.pro
}

build() {
  #export QTDIR=/usr/include/qt3
  #export PATH=/usr/lib/qt3/bin:$PATH
  cd $srcdir/$pkgname-$pkgver
  PREFIX="${pkgdir}/usr" qmake-qt3
  sed -i '/^CFLAGS/s/$/ -DQT_SHARED -DQT_THREAD_SUPPORT/' Makefile
  sed -i '/^CXXFLAGS/s/$/ -DQT_SHARED -DQT_THREAD_SUPPORT/' Makefile
  sed -i '/^MOC/s/$(QTDIR)\/bin\/moc/\/usr\/bin\/moc-qt3/' Makefile
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install
  mkdir -p $pkgdir/usr/share/umtsmon/translations/
  cp i18n/*.qm $pkgdir/usr/share/umtsmon/translations/
  install -m644 -D images/128/umtsmon-128x128.png $pkgdir/usr/share/pixmaps/umtsmon-128x128.png
}
