# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>
pkgname=tmpfs-varlog
pkgver=1
pkgrel=1
pkgdesc="Persistent storage of /var/log when /var/log is a tmpfs filesystem"
url="http://en.wikipedia.org/wiki/Tmpfs"
license="GPL"
arch=('i686' 'x86_64')
depends=('sh' 'tar')
backup=(etc/conf.d/$pkgname.conf)
install=$pkgname.install
source=($pkgname.rc.d
	$pkgname.install
	$pkgname.conf.d)
md5sums=('7a650c64d04433fe3524381e26cd45c4'
	 '38ea66e5b62d45c256730cfeef4cf55f'
	 'c0855adb4ab9463bdd29f8f4aaa8155c')

build() {

  install -D -m755 $pkgname.rc.d $startdir/pkg/etc/rc.d/$pkgname

  install -D -m755 $pkgname.conf.d $startdir/pkg/etc/conf.d/$pkgname.conf

}
