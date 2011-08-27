# Maintainer: Roberto Alsina <ralsina@kde.org>

pkgname=marave
pkgver=0.7
pkgrel=6
pkgdesc="A relaxed text editor"
arch=('any')
depends=('python2' 'python2-qt')
license=('GPL')
conflicts=('marave-svn')
provides=('marave')
optdepends=('kdebindings-python' 'python-pyenchant' 'python-rst2pdf')
url="http://marave.googlecode.com"
source=("http://marave.googlecode.com/files/marave-${pkgver}.tar.gz")

build() {
    cd $srcdir/marave-$pkgver
    python2 setup.py install --root=$pkgdir
}

md5sums=('1bb038efb7a9847697bdbf671feb7f6e')

