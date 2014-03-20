pkgname=man-db-systemd
pkgver=2.6.6
pkgrel=1
pkgdesc="A utility for reading man pages (with systemd support)"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/man-db/"
license=('GPL' 'LGPL')
groups=('base')
depends=( 'bash' 'gdbm' 'zlib' 'groff' 'libpipeline' 'less')
optdepends=('gzip' 'systemd-cron: Run service unit daily')
backup=('etc/man_db.conf')
conflicts=('man' 'man-db')
provides=('man' 'man-db')
replaces=('man')
install=man-db.install
source=(http://savannah.nongnu.org/download/man-db/man-db-$pkgver.tar.xz{,.sig}
        convert-mans man-db-update.service)
md5sums=('5d65d66191080c144437a6c854e17868'
         'SKIP'
         '2b7662a7d5b33fe91f9f3e034361a2f6'
         '223f541d2e7cac1d971f7ab06dd5f0c6')

build() {
  cd ${srcdir}/man-db-${pkgver}
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
	--with-db=gdbm \
	--disable-setuid \
	--enable-mandirs=GNU \
	--with-sections="1 n l 8 3 0 2 5 4 9 6 7"
  make
}

check() {
  cd ${srcdir}/man-db-${pkgver}
  make check
}

package() {
  cd ${srcdir}/man-db-${pkgver}
  make DESTDIR=${pkgdir} install

  # part of groff pkg
  rm -f ${pkgdir}/usr/bin/zsoelim

  # script from LFS to convert manpages, see
  # http://www.linuxfromscratch.org/lfs/view/6.4/chapter06/man-db.html
  install -D -m755 ${srcdir}/convert-mans  ${pkgdir}/usr/bin/convert-mans 

  #install whatis cron script
  install -D -m644 ${srcdir}/man-db-update.service ${pkgdir}/usr/lib/systemd/system/man-db-update.service
}

