# Contributor: lishengming.zju <lishengming.zju@gmail.com>
pkgname='coreseek'
pkgver=4.1beta
_pkgver=4.1-beta
pkgrel=2
pkgdesc='Free open-source SQL full-text search engine.'
arch=('i686' 'x86_64')
url='http://www.coreseek.cn'
license=('GPL')
depends=('libxml2' 'expat' 'libmysqlclient')
#makepends=('automake >= 1.11' 'autoconf >= 2.65' 'libtool >= 2.2.6b' 'm4 >= 1.4.13')
source=("http://www.coreseek.cn/uploads/csft/4.0/$pkgname-$_pkgver.tar.gz"
	"buildconf.sh-csft-4.1-beta.patch"
	"configure.ac-csft-4.1-beta.patch"
	"sphinxexpr.cpp-csft-4.1-beta.patch")
md5sums=('a10e71df2ea2def275b24cba4115aa69'
         'd4002e2aac8fcf980a75b53b374aa86d'
         'fa2c35946078342dcac42a83bbc37a14'
         '6b5e5f8a55b8f9f41e5c509c3a343055')
         
build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  
  cd mmseg-3.2.14
  sh ./bootstrap
  ./configure --prefix=/usr
  make &&  make DESTDIR="${pkgdir}" install
  
  cd ../csft-4.1
  ##gcc4.7+ patch
  patch -p0 <${srcdir}/buildconf.sh-csft-4.1-beta.patch
  patch -p0 <${srcdir}/configure.ac-csft-4.1-beta.patch
  patch -p0 <${srcdir}/sphinxexpr.cpp-csft-4.1-beta.patch
  
  sh buildconf.sh
  ./configure --prefix=/usr --sysconfdir=/etc/csft --localstatedir=/var/csft --without-unixodbc --with-mmseg \
  --with-mmseg-includes=${pkgdir}/usr/include/mmseg/ --with-mmseg-libs=${pkgdir}/usr/lib/ --with-mysql
  make && make DESTDIR="${pkgdir}" install
}
package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  #mv mmseg etc files to /etc/mmseg/
  mv "${pkgdir}/usr/etc/" "${pkgdir}/etc/mmseg/"
}