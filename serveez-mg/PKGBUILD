#Contributor: tantalum <tantalum at online dot de>
pkgname=serveez-mg
pkgver=0.2
pkgrel=1
pkgdesc='A server framework for the Guile 2.0 Scheme interpreter derived from the GNU Serveez project'
arch=(i686 x86_64)
license=GPL2
depends=('guile>=1.9.14' glibc make)
url=https://github.com/spk121/serveez-mg/raw/master/doc/serveez-mg.txt
source=(https://github.com/downloads/spk121/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=(f53972ce232ce4000f4114982cee372f)

build(){
 cd ${srcdir}/${pkgname}-${pkgver}

 ./configure --prefix=/usr || return 1
 make && make DESTDIR=${pkgdir} install || return 1

 #remove documentation
 if [ -e ${pkgdir}/usr/share/info ]; then
  rm -r ${pkgdir}/usr/share/info
 fi
}
