#Maintainer: wrajaka

pkgname=plasma-desktoptheme-rosa
pkgver=1.2.0
_pkgver=1.2.0-4
pkgrel=2
pkgdesc="Original theme for the plasma-desktop from ROSA Laboratory. As seen on Mandriva 2011."
arch=('any')
url="http://rosalab.ru/"
screenshot="http://www.rosalab.ru/product-slides/screen-1.png"
license=('GPL')
groups=('kde' 'kdeartwork')
depends=('kdebase-runtime')
makedepends=('rpmextract')
source=(ftp://ftp.pbone.net/mirror/carroll.cac.psu.edu/pub/linux/\
distributions/mandrakelinux/devel/cooker/SRPMS/main/release/${pkgname}-${_pkgver}.src.rpm)
md5sums=('b4679736dc23ccc5dad5095e65be9c81')

build() {
  cd $srcdir/
  rpmextract.sh ${pkgname}-${_pkgver}.src.rpm
  tar -xvf ${pkgname}-${pkgver}.tar.bz2
  cd ROSA
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/share/apps \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    .
  make  
  install -d $pkgdir/usr/share/apps/desktoptheme/rosa/dialogs
  install -d $pkgdir/usr/share/apps/desktoptheme/rosa/icons
  install -d $pkgdir/usr/share/apps/desktoptheme/rosa/opaque/dialogs
  install -d $pkgdir/usr/share/apps/desktoptheme/rosa/opaque/widgets
  install -d $pkgdir/usr/share/apps/desktoptheme/rosa/widgets 
  install dialogs/* $pkgdir/usr/share/apps/desktoptheme/rosa/dialogs 
  install icons/* $pkgdir/usr/share/apps/desktoptheme/rosa/icons 
  install opaque/dialogs/* $pkgdir/usr/share/apps/desktoptheme/rosa/opaque/dialogs 
  install opaque/widgets/* $pkgdir/usr/share/apps/desktoptheme/rosa/opaque/widgets
  install widgets/* $pkgdir/usr/share/apps/desktoptheme/rosa/widgets 
  install colors LICENSE metadata.desktop $pkgdir/usr/share/apps/desktoptheme/rosa
  chmod 755 -R ${pkgdir}/usr/share/apps/desktoptheme
  find ${pkgdir}/ -name ".directory" -type f -exec rm -fr '{}' \;
}