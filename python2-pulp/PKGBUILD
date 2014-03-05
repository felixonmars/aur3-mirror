# Contributor: BinkyTheClown <binky_at_archlinux_dot_us>
# Contributor: Manuel Bärenz <manuel@enigmage.de>
# Maintainer: Robert Schwarz <mail@rschwarz.net>
pkgname='python2-pulp'
pkgver='1.5.4'
pkgrel='2'
pkgdesc='A Linear Programming modeler written in python'
url="http://code.google.com/p/pulp-or"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python2>=2.5' 'python2-pyparsing')
conflicts=('pulp')
source=("http://pulp-or.googlecode.com/files/PuLP-$pkgver.zip")
md5sums=('8cf36a8a5c09dae83434e057e6645543')

build() {
    cd $srcdir/PuLP-$pkgver
    python2 setup.py build
    python2 setup.py install --root=$pkgdir
}
