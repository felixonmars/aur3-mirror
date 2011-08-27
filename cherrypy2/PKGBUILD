# Contributor: Tocer Deng <tocer.deng@gmail.com>

pkgname=cherrypy2
pkgver=2.3.0
pkgrel=2
pkgdesc="A pythonic, object-oriented web development framework"
arch=('i686' 'x86_64')
url="http://www.cherrypy.org"
license=('BSD')
depends=('python2')
source=(http://download.cherrypy.org/cherrypy/$pkgver/CherryPy-$pkgver.tar.gz)
md5sums=('80ce0f666f2899d4e681432e4061db16')

build() {
    cd $startdir/src/CherryPy-$pkgver
    python2 ./setup.py install --root=$startdir/pkg
    #install -D -m644 $startdir/src/license $startdir/pkg/usr/share/licenses/$pkgname/license
}

# vim:set ts=2 sw=2 et:
