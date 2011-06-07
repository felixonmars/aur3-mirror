# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: oslik@defender.inet
pkgname=python2-pygsl
srcname=pygsl
pkgver=0.9.5
pkgrel=2
pkgdesc="Python interface wrapper for GNU scientific library(GSL)"
url="http://pygsl.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('python2' 'gsl')
makedepends=()
conflicts=('python-gsl')
replaces=('python-gsl')
backup=()
install=
source=(http://downloads.sourceforge.net/project/$srcname/$srcname/$srcname-$pkgver/$srcname-$pkgver.tar.gz)
md5sums=('fca5cbda1380218a28f2ebdc15a224fb')

package() {
    cd "$srcdir/$srcname-$pkgver"
    python2 setup.py install --root=$pkgdir/ --optimize=1
}
