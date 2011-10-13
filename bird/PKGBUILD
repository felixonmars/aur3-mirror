pkgname=bird
pkgver=1.3.4
pkgrel=1
pkgdesc="a dynamic routing daemon for UNIX-like systems"
arch=(i686 x86_64)
license=('GPL')
depends=('readline')
makedepends=('perl' 'bison' 'flex')
options=()
url="http://bird.network.cz/"
source=(ftp://bird.network.cz/pub/bird/${pkgname}-${pkgver}.tar.gz bird.service bird6.service)

backup=('etc/bird.conf' 'etc/bird6.conf')

build() {
  cd "${srcdir}"
  cp -a ${pkgname}-${pkgver} ${pkgname}-${pkgver}-ipv4
  cp -a ${pkgname}-${pkgver} ${pkgname}-${pkgver}-ipv6

  cd "${srcdir}/${pkgname}-${pkgver}-ipv4"
  ./configure --sysconfdir=/etc --prefix=/usr --localstatedir=/var
  make

  cd "${srcdir}/${pkgname}-${pkgver}-ipv6"
  ./configure --sysconfdir=/etc --prefix=/usr --localstatedir=/var --enable-ipv6
  make
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}-ipv4"
  make sysconfdir=${pkgdir}/etc prefix=${pkgdir}/usr localstatedir=${pkgdir}/var install
  make docdir=${pkgdir}/usr/share/doc/${pkgname}-${pkgver} install-docs

  cd "${srcdir}/${pkgname}-${pkgver}-ipv6"
  make sysconfdir=${pkgdir}/etc prefix=${pkgdir}/usr localstatedir=${pkgdir}/var install

  mkdir -p ${pkgdir}/lib/systemd/system/
  cp ${srcdir}/bird.service ${pkgdir}/lib/systemd/system/
  cp ${srcdir}/bird6.service ${pkgdir}/lib/systemd/system/
}

md5sums=('20f5aa9d3f853d2c922438dc9d922ecc'
         'e78155b5a8da230d047ef5270538766d'
         'e78155b5a8da230d047ef5270538766d')
