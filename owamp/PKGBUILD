# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>
pkgname=owamp
pkgver=3.1
pkgrel=2
pkgdesc="RFC4656 - One-Way Active Measurement Protocol a.k.a. One Way Ping"
url="http://e2epi.internet2.edu/owamp/"
license="custom"
arch=('i686' 'x86_64')
makedepends=('automake' 'coreutils' 'gawk' 'make' 'gcc' 'binutils' 'grep'
	     'glibc')
depends=('glibc' 'ntp')
backup=('etc/owamp/owampd.conf'
	'etc/owamp/owampd.limits'
	'etc/owamp/owampd.pfs')
install=install.owamp
source=(http://e2epi.internet2.edu/owamp/download/$pkgname-$pkgver.tar.gz
	install.owamp
	owampd.rc.d)
md5sums=('7e9c75b3102ca48df2cd7e0de77de759'
	 '9a77b37ea8847493d48d857ba5c48efa'
	 '24e6d81e555c44d70e0dbd0ed00f45e1')  

build() {

  cd $startdir/src/$pkgname-$pkgver

  ./configure -C \
	--prefix=/usr \
	--sysconfdir=/etc/owamp \
	--mandir=/usr/share/man

  make || return 1
  make DESTDIR=$startdir/pkg install

  install -D -m444 conf/owampd.conf \
	$startdir/pkg/etc/owamp/owampd.conf.sample
  install -D -m444 conf/owampd.limits \
	$startdir/pkg/etc/owamp/owampd.limits.sample

  install -D -m755 $startdir/owampd.rc.d \
	$startdir/pkg/etc/rc.d/owampd

  install -D -m444 LICENSE \
	$startdir/pkg/usr/share/licenses/$pkgname/LICENSE

}
