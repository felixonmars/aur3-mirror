# Contributor: Khiem Nguyen <tenrouken@gmail.com>
pkgname=jicmp
pkgver=1.2.1
pkgrel=1
pkgdesc="Java interface to ICMP"
arch=('i686' 'x86_64')
url="http://www.opennms.org"
license=('GPL')
depends=('jre')
makedepends=('automake')
source=("http://downloads.sourceforge.net/project/opennms/JICMP/stable-1.2/${pkgname}-${pkgver}.tar.gz")
md5sums=('8f4dc8d0fa8293158c6f620ceb1c73ea')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --with-java=/opt/java
  make || return 1
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
