# $Id: #
# Maintainer: Gustavo Chain <g@0xff.cl>

pkgname=pyxmlsec
pkgver=0.3.0
pkgrel=1
pkgdesc="PyXMLSec is a set of Python bindings for the XML Security Library."
url="http://pyxmlsec.labs.libre-entreprise.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python' 'libxml2' 'xmlsec')
source=("http://labs.libre-entreprise.org/download.php/430/$pkgname-$pkgver.tar.gz")
md5sums=('150631f634654804076f73a0859fea1a')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir
}

