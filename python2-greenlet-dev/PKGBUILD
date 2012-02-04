# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: Ralf Schmitt <ralf@systemexit.de>
# Refs: https://bitbucket.org/ambroff/greenlet/issue/29/segfault-on-fedora-15
# Refs: https://bitbucket.org/ambroff/greenlet/issue/16/segfault-on-64-bit-linux
# Refs: https://bitbucket.org/ambroff/greenlet/issue/32/greenlet-release-cycle

pkgname=python2-greenlet-dev
pkgver=0.3.1
pkgrel=77363116e78d
_pkgauth=snaury
pkgdesc="Python Coroutine Library"
arch=('i686' 'x86_64')
license=("MIT")
url="http://pypi.python.org/pypi/greenlet"
depends=('python2')
provides=('python2-greenlet')
conflicts=('python2-greenlet')
source=("https://bitbucket.org/$_pkgauth/greenlet/get/$pkgrel.zip")
md5sums=('351902e3a031d191569cd2e5c21756a8')

build() {
	cd $startdir/src/$_pkgauth-greenlet-$pkgrel
	/usr/bin/python2 setup.py build
	/usr/bin/python2 setup.py install --root=$startdir/pkg
}
