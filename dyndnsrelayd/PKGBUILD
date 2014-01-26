# Maintainer: Raimar Buehmann (raimar)
# Contributor: Raimar Buehmann (raimar)

pkgname=dyndnsrelayd
pkgver=1.0.0.r13.20140125
pkgrel=3
pkgdesc="Daemon, which waits for incoming http DynDNS requests and then executes an https DynDNS request."
arch=(i686 x86_64)
url=https://bitbucket.org/raimar/dyndnsrelayd
license=(LGPL)
depends=(glibc)
optdepends=(
	"curl: Allow calling DynDNS API to update new IP"
)
provides=($pkgname)
conflicts=($pkgname)
replaces=($pkgname)
makedepends=(git gcc)
backup=(etc/systemd/system/$pkgname.service.d/ExecStart.conf etc/$pkgname/.netrc)
source=($pkgname::git+https://bitbucket.org/raimar/$pkgname.git)
md5sums=(SKIP)

_gitroot=$pkgname
install=$pkgname.install

pkgver() {
	# remove ".r*.*" from package version
	_pkgverTriple=$(echo $pkgver | sed "s/\.r.*//g")
	cd $_gitroot
	# get number of last git commit
	_commitCount=$(git rev-list --count HEAD)
	# get time of last git commit
	_commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
	# add ".r*.*" from package version
	echo "$_pkgverTriple.r$_commitCount.$_commitTime"
}

build() {
	cd $_gitroot
	# compile executable service with size optimization (-Os)
	gcc -Os src/$pkgname.c -o $pkgname
}

package() {
	cd $_gitroot
	# executable service for all executable and only writable for root
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
	# service file for systemd only writable for root
	install -Dm644 pkg/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
	# service file for systemd only writable for root
	install -Dm644 pkg/$pkgname-restart-after-sleep.service $pkgdir/usr/lib/systemd/system/$pkgname-restart-after-sleep.service
	# create config file for execution command
	install -Dm644 pkg/ExecStart.conf $pkgdir/etc/systemd/system/dyndnsrelayd.service.d/ExecStart.conf
	# .netrc contains user and password; only user $pkgname can read and write
	install -Dm600 pkg/.netrc $pkgdir/etc/$pkgname/.netrc
} 

# vim:set ts=2 sw=2 et:
