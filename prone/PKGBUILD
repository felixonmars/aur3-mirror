# Maintainer: Pierre Chiche <pierre dot chiche at gmail dot com>
pkgname=prone
pkgver=0.2.2
pkgrel=1
pkgdesc="Raytracing client for collaborative rendering farm corefarm.org."
arch=('i686' 'x86_64')
url="http://corefarm.org/"
license=('GPL')
depends=('boost' 'libjpeg' 'yafaray')
makedepends=('scons')
source=(http://www.corefarm.org/downloads/${pkgname}/${pkgname}_${pkgver}.tar.gz)
md5sums=(4ac1d397eb6549dceb6f05d486d23be1)

build() {
   cd "${srcdir}/${pkgname}_${pkgver}"

   sed 's|/usr/local|/usr|' -i ${srcdir}/${pkgname}_${pkgver}/yafaray/config/linux2-config.py
   sed 's|boost_thread|boost_thread-mt|' -i ${srcdir}/${pkgname}_${pkgver}/yafaray/config/linux2-config.py

   sed 's|/usr/local|/usr|' -i ${srcdir}/${pkgname}_${pkgver}/corefarm_wrapper/config/linux2-config.py
   sed 's|boost_thread|boost_thread-mt|' -i ${srcdir}/${pkgname}_${pkgver}/corefarm_wrapper/config/linux2-config.py

   cd "${srcdir}/${pkgname}_${pkgver}/yafaray"
   scons   PREFIX="/usr" || return 1

   cd "${srcdir}/${pkgname}_${pkgver}/corefarm_wrapper"
   scons   PREFIX="/usr" || return 1

   install -D -m 755 ${srcdir}/${pkgname}_${pkgver}/corefarm_wrapper/build/slave/prone ${pkgdir}/usr/bin/prone
}
