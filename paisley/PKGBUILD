# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=paisley
pkgver=0.1
pkgrel=1
pkgdesc="A CouchDB client written in Python to be used within a Twisted application"
arch=('i686' 'x86_64')
url="http://launchpad.net/paisley"
license=('MIT')
depends=('python')
source=(http://launchpad.net/paisley/0.1/0.1/+download/paisley-0.1.tar.gz)
sha1sums=(ad17c37f08417261f723a25af2a16ecf89e818a1)

build() {
	cd $startdir/src/paisley-$pkgver
	python setup.py install --prefix=/usr --root=$startdir/pkg
}
