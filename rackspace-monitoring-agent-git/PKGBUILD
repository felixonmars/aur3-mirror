# Maintainer: Pablo Lluch <pablo.lluch@gmail.com>

pkgname=rackspace-monitoring-agent-git
pkgver=0.1.9.r97.g533ea48
pkgrel=1
pkgdesc="A monitoring agent for rackspace VPS which uses the infrastructure provided by virgo-base-agent."
url="https://github.com/virgo-agent-toolkit/rackspace-monitoring-agent"
arch=('i686' 'x86_64')
license=('Apache License 2.0')
depends=('')
makedepends=('python2' 'git')

source=("$pkgname::git+https://github.com/virgo-agent-toolkit/rackspace-monitoring-agent.git"
		"rackspace-monitoring-agent.service")
md5sums=('SKIP'
		 'c9a510396f3010a32c547c2aff773333')

install=$pkgname.install

prepare(){
	[[ ! -d $srcdir/python-path ]] && mkdir $srcdir/python-path
	ln -sf /usr/bin/python2 $srcdir/python-path/python
	export PATH="$srcdir/python-path:$PATH"
	cd $srcdir/$pkgname
	git submodule init
	git submodule update
}

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	git submodule update --init --recursive
	# This prefix is necessary due to an upstream bug
	./configure --prefix="$pkgdir"
	make
}

package() {
	cd "$srcdir/$pkgname"
	# With the earlier prefix this will go to correct directory
	make install
	# Remove empty folder
	rm -rf "$pkgdir/etc"
	install -Dm644 $srcdir/rackspace-monitoring-agent.service $pkgdir/usr/lib/systemd/system/rackspace-monitoring-agent.service
}
