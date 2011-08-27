#Contributor: Jesus Lazaro Plaza <jesuslazaro84@gmail.com>
#Additional Help: Lawrence Lee <valheru@facticius.net>

pkgname=f4l
pkgver=0.2.1
pkgrel=6
pkgdesc="Flash for Linux. Tool for creating flash movies"
license=('GPL')
arch=('i686' 'x86_64')
url="http://f4l.sourceforge.net/"
depends=('qt3')
source=(http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2 f4l.patch)
md5sums=('dcc2ef251814008e753becb933afb266' '1e692cd1dea2f216dcd4fc7e1bfcdd1e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i $startdir/src/f4l.patch

  source /etc/profile.d/qt3.sh
  QMAKESPEC=${QTDIR}/mkspecs/default
  
  ${QTDIR}/bin/qmake
  cd src
  ${QTDIR}/bin/qmake
  cd ..
  make || return 1
  
  install -D -m755 ${startdir}/src/${pkgname}-${pkgver}/bin/f4l ${startdir}/pkg/usr/bin/f4l
}
