# Contributor: Branko Vukelic (bg.branko@gmail.com)
pkgname=lprof
pkgver=1.11.4.1
pkgrel=3
arch=(i686 x86_64)
pkgdesc="Imaging device calibration tool"
url="http://lprof.sourceforge.net/"
license="GPL"
depends=('qt3' 'lcms>=1.12' 'vigra>=1.3')
makedepends=('python>=1.53' 'scons')
source=(http://downloads.sourceforge.net/lprof/${pkgname}-${pkgver}.tar.gz
        lcms-117.patch)
md5sums=('2177c77c24aa10db9b7681d264735ea9'
         '5ce946c711462428a10116065647c823')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -p0<../lcms-117.patch
  sed -i "s/'tiff'/'tiff','png'/" SConstruct || return 1
  rm -rf scons*
  scons PREFIX=/usr qt_directory=/opt/qt/ || return 1
  install -d ${startdir}/pkg/usr
  scons PREFIX=${startdir}/pkg/usr install
}
