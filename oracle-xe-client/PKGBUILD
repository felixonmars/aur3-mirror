# Contributor: Maciej Libuda <maciej.libuda@gmail.com>

pkgname=oracle-xe-client
pkgver=10.2.0.1
pkgrel=1
pkgdesc="Client for Oracle XE DBMS"
arch=('i686', 'x86_64')
url="http://www.oracle.com/"
license=('custom')
makedepends=('rpmextract')
conflicts=('oracle-xe')
options=('!strip')
source=(oracle-xe-client-10.2.0.1-1.0.i386.rpm)
md5sums=('26913f419621f5b961857796d2f8411c')

build() {
	cd $startdir/pkg
	rpmextract.sh $startdir/src/oracle-xe-client-10.2.0.1-1.0.i386.rpm

	find $startdir/pkg -type d -perm 700 -print0 | xargs -0r chmod 755

	mkdir -p $startdir/pkg/etc/profile.d
	cp $startdir/pkg/usr/lib/oracle/xe/app/oracle/product/10.2.0/client/bin/oracle_env.sh $startdir/pkg/etc/profile.d/

	# License
  	mkdir -p $startdir/pkg/usr/share/licenses/custom/$pkgname
  	cp $startdir/license.txt $startdir/pkg/usr/share/licenses/custom/$pkgname/
}

# vim:set ts=2 sw=2 et:
