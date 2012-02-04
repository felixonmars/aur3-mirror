# Contributor: oldbay <old_bay@mail.ru>

pkgname=sams2-svn
pkgver=2
pkgrel=1
pkgdesc="sams"
arch=(i686 x86_64)
url="http://sams.perm.ru/"
depends=('mysql' 'postgresql' 'squid' 'php' 'php-ldap' 'php-odbc' 'php-gd' 'php-pgsql' 'php-apache' 'apache')
makedepends=('gcc' 'autoconf')
license=('GPL')
backup=(etc/sams2.conf)
source=('samsd.archlinux')

build() {
  cd ${srcdir}
  svn co https://sams2.googlecode.com/svn/trunk

  cd ${srcdir}/trunk
  make -f Makefile.cvs

  ./configure --prefix=/usr  --sysconfdir=/etc

  make
  
  make DESTDIR="$pkgdir" install || return 1


  sed -i -e 's|WBINFOPATH=/usr/local|WBINFOPATH=/usr/bin|g' ${pkgdir}/etc/sams2.conf
  sed -i -e 's|SAMSPATH=/usr/local|SAMSPATH=/usr|g' ${pkgdir}/etc/sams2.conf

  mkdir -p ${pkgdir}/etc/httpd/conf/extra
  mv -f ${pkgdir}/doc4sams2.conf ${pkgdir}/etc/httpd/conf/extra/
  mv -f ${pkgdir}/sams2.conf ${pkgdir}/etc/httpd/conf/extra/

  mkdir -p ${pkgdir}/etc/rc.d
  install -D -m755 ${srcdir}/samsd.archlinux ${pkgdir}/etc/rc.d/samsd

}

md5sums=('c9962b2ff41ce16abb394c8bc1711d38')
