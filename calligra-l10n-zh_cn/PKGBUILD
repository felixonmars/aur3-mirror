# $Id: $
# Maintainer: Modified by dgy18787 <dgy18787@126.com> , Original:Ronald van Haren <ronald.archlinux.org>

pkgbase=calligra-l10n
pkgname=('calligra-l10n-zh_cn')
pkgver=2.4.0
pkgrel=1
arch=('any')
url='http://www.calligra.org'
license=('GPL')
groups=('calligra-l10n')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'kdelibs' 'docbook-xml')
options=('docs')
mirror="http://download.kde.org"
source=("$mirror/stable/calligra-${pkgver}/calligra-l10n/${pkgbase}-zh_CN-${pkgver}.tar.bz2")

build() {
  cd $srcdir

  install -d build/zh_CN
  cd build/zh_CN
  cmake ${srcdir}/calligra-l10n-zh_CN-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make 
  cd ../..
}


package_calligra-l10n-zh_cn() {
        pkgdesc=This is the Simplified Chinese Localization for Calligra. First you should install calligra from kde-unstable. This pkgbuild is modified from calligra-l10n.[Ronald van Haren]
        cd $srcdir/build/zh_CN
        make DESTDIR=$pkgdir install
}


md5sums=('2f1df7fec679f879af0f49de96cee66d')
