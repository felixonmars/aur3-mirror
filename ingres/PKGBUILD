pkgname=ingres
pkgver=9.3.0
pkgrel=1
pkgdesc="Ingres DBMS Community Edition"
arch=('i686' 'x86_64')
url="http://www.ingres.com"
license="GPLv2"
unamem=`uname -m`
install=(ingres.install)
source=(http://bugs.ingres.com/download/ingres-${pkgver}-${pkgrel}-${unamem}.tgz)
if [ "${unamem}" == "x86_64" ] ; then
  md5sums=(c8b28fa3b39bc2848c9fa597895095b4)
else
  md5sums=(870d26333694104b17a4e1d859dab2f4)
fi

build() {
  mkdir -p ${pkgdir}/tmp/ii_install
  cp -rf ${srcdir}/* ${pkgdir}/tmp/ii_install
  chmod 1777 ${pkgdir}/tmp
}
