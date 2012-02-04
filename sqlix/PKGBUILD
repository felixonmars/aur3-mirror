# Contributor: Ermak <ermak@email.it>
pkgname=sqlix
pkgver=1.0
pkgrel=1
pkgdesc="SQL injection scanner written in Perl"
arch=('i686' 'x86_64')
url="http://www.owasp.org/index.php/Category:OWASP_SQLiX_Project"
license=('GPL')
depends=('perl-html-tree' 'perl-algorithm-diff' 'perl-tie-chararray' 'perl-www-checksite')
source=(http://dev.pentoo.ch/~jensp/distfiles/SQLiX_v1.0.tar.gz)
md5sums=('b97cf678640b6b73155855a0356523d5')

build() {
  mkdir -p $startdir/pkg/opt/sqlix
  chmod 777 $startdir/src/*/lwp_cookies.dat

  cp -ax $startdir/src/*/* $startdir/pkg/opt/sqlix
	mkdir -p $startdir/pkg/usr
	mkdir -p $startdir/pkg/usr/bin

  echo '#!/bin/bash' > $startdir/pkg/usr/bin/sqlix
  echo 'DIR=`pwd`' >> $startdir/pkg/usr/bin/sqlix
  echo 'cd /opt/sqlix' >> $startdir/pkg/usr/bin/sqlix
  echo 'perl SQLiX.pl $@' >> $startdir/pkg/usr/bin/sqlix
  echo 'cd "$DIR"' >> $startdir/pkg/usr/bin/sqlix
  chmod 755 $startdir/pkg/usr/bin/sqlix
}

# vim:set ts=2 sw=2 et:
