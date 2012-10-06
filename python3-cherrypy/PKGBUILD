# Maintainer: BeholdMyGlory <larvid@gmail.com>

pkgname=python3-cherrypy
pkgver=3.2.2
pkgrel=2
codes=6d909d9ca9a1
pkgdesc="A pythonic, object-oriented web development framework"
arch=('i686' 'x86_64')
url="http://www.cherrypy.org"
license=('BSD')
conflicts=('cherrypy')
depends=('python')
source=(https://bitbucket.org/cherrypy/cherrypy/get/$codes.tar.bz2 license)
#source=(http://download.cherrypy.org/cherrypy/$pkgver/CherryPy-$pkgver.tar.gz 
#	license)
md5sums=('4ab1c587a3a63453fcce814d4e9f7427' '22365dc6b0e6835b53da009aa36af017')
#md5sums=('c1b1e9577f65f9bb88bfd1b15b93b911'
#         '22365dc6b0e6835b53da009aa36af017')
build() {
    #cd $srcdir/CherryPy-$pkgver
    cd $srcdir/cherrypy-cherrypy-$codes
    python ./setup.py install --root=$pkgdir
    #install -D -m644 $srcdir/license $pkgdir/usr/share/licenses/$pkgname/license
    install -D -m644 cherrypy/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
