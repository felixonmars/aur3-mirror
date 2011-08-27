# Contributor: lp76 <l.peduto@gmail.com>
pkgname=ipscan-svn
pkgver=463
pkgrel=1
pkgdesc="An open-source and cross-platform network scanner designed to be fast and simple to use"
url="http://www.angryziber.com/w/Home"
arch=('i686')
license=('GPL')
depends=('jre')
makedepends=('subversion' 'apache-ant' 'jdk')
conflicts=('ipscan')
provides=('ipscan')
source=('ipscan.sh' 'disable-deb-rpm-package.patch')
md5sums=('d9cdd31c8ca74b6b411f6ec0f94d8f8c' 'c01a199280566aa6243ed1abd07b8181')

_svntrunk=https://ipscan.svn.sourceforge.net/svnroot/ipscan/trunk
_svnmod=ipscan

build() {
	cd $srcdir

	# Get Latest Source Code
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	# Install
	cd $_svnmod

	# Disable the creation of deb/rpm package
  	patch -p0 -i ../disable-deb-rpm-package.patch || return 1

  	ant linux
  	install -D dist/ipscan-linux-3.0-svn.jar $pkgdir/usr/share/ipscan/ipscan.jar
  	install -D -m 755 $startdir/src/ipscan.sh $pkgdir/usr/bin/ipscan
}
