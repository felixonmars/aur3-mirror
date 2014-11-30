# Maintainer: Kovivchak Evgen <oneonfire@gmail.com> 
# Contributor: sinisa

pkgname=tazweb
pkgver=1.9
pkgrel=1
pkgdesc="Web browser from SlitazLinux"
arch=('i686' 'x86_64')
url="http://www.slitaz.org"
license=('GPL')
groups=('network')
depends=('webkitgtk2')
source=(http://mirror.slitaz.org/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('aae2f2665ea05814774a86c9fbffdb07')


package() {
  #patch -p0 < ../tazweb_arch.patch	
  #patch -p0 <../tazweb_homepage.patch	
  cd ${srcdir}/${pkgname}-${pkgver}
  make msgfmt
  make
  make prefix=/usr DESTDIR=${pkgdir} install
}
