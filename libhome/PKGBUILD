# Maintainer: Dan Vratil <vratil@progdansoft.com>

pkgname=libhome
pkgver=0.10.2
pkgrel=1
pkgdesc="libhome is a configurable getpwnam(3) emulator"
makedepends=(pam mysql openldap)
license=('uknown')
arch=('i686' 'x86_64')
url="http://pll.sf.net"
source=(http://downloads.sourceforge.net/project/pll/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)

build() {

  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
	      --with-ldap \
	      --with-mysql \
	      --with-pam || return 1
  make || return 1
}

package() {

  mkdir -p ${pkgdir}/usr/{lib,bin,share/man/man{5,8},include}
  mkdir -p ${pkgdir}/{sbin,etc}

  cd ${srcdir}/${pkgname}-${pkgver}
  make libdir=${pkgdir}/usr/lib \
       bindir=${pkgdir}/usr/bin \
       sbindir=${pkgdir}/sbin \
       includedir=${pkgdir}/usr/include \
       mandir=${pkgdir}/usr/share/man/ \
       install || return 1

  install home.conf ${pkgdir}/etc/home.conf
}
md5sums=('f7129ae34d3c44d38ac785e7a1f7d509')
