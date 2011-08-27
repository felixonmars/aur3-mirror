# Contributor: Ali H. Caliskan <ali.h.caliskan//gmail.com>

_filename=linux_11gR1_database_1013.zip
pkgname=oracle
pkgver=11gR1
pkgrel=1
pkgdesc="Database Management System"
url="http://www.oracle.com"
arch=('i686' 'x86_64')
license=('OTN')
install=${pkgname}.install
depends=('java-runtime' 'ksh' 'rpm' 'gawk' 'gdb' 'libaio' 'libelf' \
	 'sysstat' 'libstdc++5')
[ "$CARCH" = "i686" ] && depends=(${depends[@]} 'unixodbc')
conflicts=('oracle-xe')
[ "$CARCH" = "x86_64" ] && _filename=linux.x64_11gR1_database_1013.zip
source=("$_filename" 'oracledb' 'ee.rsp.patch')
md5sums=('a54e9380a40cecfc5bf6da99c857c39b'
	 '312a4d0253e253df1e9bd54b13e6c3cd'
	 '41d814ec8ff90931561ed3c13ffae29b')
[ "$CARCH" = "x86_64" ] && md5sums[0]='b575b12fe5aa1595f6ddfb256de5d362'

build() {
	cd $srcdir

	# Creating ORACLE_HOME dir
	mkdir -p $pkgdir/home/oracle/app/oracle/product/11.1.0/orarch

	# Copy Oracle database files
	mkdir -p $pkgdir/home/oracle/tmp
	mv database $pkgdir/home/oracle/tmp/

  if [ "$CARCH" = "x86_64" ]; then

	# Preparing for the native unzip 
	mv $pkgdir/home/oracle/tmp/database/install/unzip \
	$pkgdir/home/oracle/tmp/database/install/unzip.bak

	# Creating x64_64 specific symbolic links
	mkdir -p $pkgdir/usr
	/bin/ln -s /usr/lib $pkgdir/usr/lib64
	/bin/ln -s /usr/bin/unzip \
	$pkgdir/home/oracle/tmp/database/install/unzip

  fi

	# Patching the Oracle database
	export PATCH=`pwd`
	cd $pkgdir/home/oracle/tmp
	patch -Np1 -i $PATCH/ee.rsp.patch

	# Creating symbolic links 
	mkdir -p $pkgdir/bin
	mkdir -p $pkgdir/usr/bin
	/bin/ln -s /usr/bin/ksh $pkgdir/bin/ksh 
	/bin/ln -s /bin/awk $pkgdir/usr/bin/awk
	/bin/ln -s /bin/tr $pkgdir/usr/bin/tr
	/bin/ln -s /usr/bin/basename $pkgdir/bin/basename

	# Install oracledb
	install -Dm755 $srcdir/oracledb $pkgdir/etc/rc.d/oracledb
}
