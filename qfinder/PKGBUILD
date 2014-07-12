pkgname=qfinder
pkgver=1.1.2.0522
pkgrel=1
pkgdesc="QFinder - A tool to find and setup QNAP NAS devices over LAN"
arch=(x86_64)
url="http://www.qnap.com/i/en/family_apply_v2/con_show.php?op=showone&cid=9#f8_07"
license=('unknown')
depends=(lib32-qt4 lib32-gtk2 lib32-libpng12 lib32-libcanberra)
source=(http://eu1.qnap.com/Storage//Utility/QNAPQfinderLinux-${pkgver}.tar.gz
        Qfinder.desktop
        GeneralFinder.png)
md5sums=('e8511653dedcfee852b97142374d2e86'
         'd51fbb05e8f0bff4bb3d3af91d5ff8b8'
         '13a1e2ad06bc87c6ab406689ad1f7434')
         
package() {
  cd $srcdir
  
  mkdir -p ${pkgdir}/opt/qfinder
  tar -xvf QNAPQfinderLinux-${pkgver}.tar.gz -C ${pkgdir}/opt/qfinder
  
  #fixing Qfinder
  sed -i 's%#!/bin/sh%#!/bin/sh\n\ncd /opt/qfinder/Qfinder%' ${pkgdir}/opt/qfinder/Qfinder/Qfinder
  sed -i '/chmod/d' ${pkgdir}/opt/qfinder/Qfinder/Qfinder
  
  mkdir -p ${pkgdir}/usr/bin
  ln -sf /opt/qfinder/Qfinder/Qfinder ${pkgdir}/usr/bin/qfinder
  
  mkdir -p ${pkgdir}/usr/lib32
  cd "$pkgdir/usr/lib32/"
  ln -sf libjpeg.so libjpeg.so.62
  install -Dm644 ${srcdir}/Qfinder.desktop ${pkgdir}/usr/share/applications/Qfinder.desktop
  install -Dm644 ${srcdir}/GeneralFinder.png ${pkgdir}/usr/share/pixmaps/GeneralFinder.png
}

