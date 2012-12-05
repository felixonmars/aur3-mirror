# $Id: PKGBUILD 82 2009-07-17 19:56:55Z aaron $
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Slash Bunny <demodevil@gmail.com>

pkgname=gps
pkgver=1.1.0
pkgrel=3
pkgdesc="Graphical Process Statistics"
arch=(i686 x86_64)
license=('GPL2')
url="http://gps.seul.org/"
depends=('gtk>=1.2.6') #and header files for kernel (most likely kernel26)
source=(ftp://ftp.seul.org/pub/gps/${pkgname}-${pkgver}.tar.gz)
md5sums=('d50d065bfe9c6bf1017bfee71bb0c377')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/doc
  ln -f -s rgpsp_linux ${pkgdir}/usr/bin/rgpsp
  mv ${pkgdir}/etc/rc.d/init.d/rgpsp ${pkgdir}/etc/rc.d/rgpsp
  rm -rf ${pkgdir}/etc/rc.d/init.d
  chmod 0644 ${pkgdir}/etc/rgpsp.conf ${pkgdir}/usr/share/icons/* ${pkgdir}/usr/man/man1/*
}
