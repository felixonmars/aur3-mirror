# Contributor: osily <ly50247 at gmail dot com>
# Contributor: kfgz <kfgz at interia dot pl>

pkgname=skyeye
pkgver=1.3.5_rc1
pkgrel=1
pkgdesc="emulator which supports various ARM platforms"
arch=('i686' 'x86_64')
url="http://www.skyeye.org/"
license=('GPL')
depends=('gtk2')
options=(!makeflags)
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-${pkgver%_rc1}/$pkgname-$pkgver.tar.bz2)
md5sums=('fc9c5278df1d2b410fed1d39488804c6')


build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --sysconfdir=/usr/share --prefix=/usr
  sed -i 's|rm -f -r|#rm -f -r|g' Makefile
  sed -i 's|cp -a|#cp -a|g' Makefile 
  make lib
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  #make install_lib install
  make DESTDIR="${pkgdir}" install_lib install
  
  rm ${pkgdir}/usr/lib/libbfd.a
  rm ${pkgdir}/usr/lib/libbfd.so
  rm ${pkgdir}/usr/lib/libiberty.a
  rm ${pkgdir}/usr/lib/libopcodes.a
  rm ${pkgdir}/usr/lib/libopcodes.so
  #mv ${pkgdir}/usr/lib/${pkgname}/* ${pkgdir}/usr/lib/ 
  #rmdir ${pkgdir}/usr/lib/${pkgname}
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  bsdtar -czf ${pkgdir}/usr/share/${pkgname}/testsuite.tgz ${srcdir}/${pkgname}-${pkgver}/testsuite
  rm -rf ${pkgdir}/usr/info
  rm ${pkgdir}/usr/include/*.*
}

