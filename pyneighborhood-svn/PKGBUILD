# Maintainer: Stefan J. Betz <info at stefan-betz dot net>
# Contributor: Carbon Jiao <carbonjiao at gmail dot com>
pkgname=pyneighborhood-svn
pkgver=577
pkgrel=1
url='https://launchpad.net/pyneighborhood'
pkgdesc="OpenSource GTK+ based SMB/CIFS Browsing utility"
license=('GPL3')
provides=('pyneighborhood')
conflicts=('pyneighborhood')
makedepends=('bzr>=2')
depends=('python2>=2.5' 'pygtk>=2.6' 'samba>=3.0' 'gettext>=0.16' 'smbclient>=3.0')
arch=('i686' 'x86_64')

build() {
	cd $srcdir
	bzr export -r $pkgver $pkgname-$pkgver http://bazaar.launchpad.net/~pyneighborhood/pyneighborhood/devel/
	cd $pkgname-$pkgver
	patch -p0 < patches/python2.patch
	make DESTDIR=$pkgdir/usr install || return 1
}
