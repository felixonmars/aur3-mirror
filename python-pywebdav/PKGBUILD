# Maintainer: Dan Serban (dserban01 => gmail)
# Contributor: Gour <gour@gour-nitai.com>

pkgname=python-pywebdav
pkgver=0.9.4.1
pkgrel=1
pkgdesc="A standards compliant WebDAV server and library written in Python"
arch=('any')
url="http://code.google.com/p/pywebdav/"
license=('GPLv2')
depends=('python2' 'pyxml')
makedepends=('python2-distribute')
source=(http://pywebdav.googlecode.com/files/PyWebDAV-$pkgver.tar.gz)
md5sums=('f0588d7b9d2494361879f89b2a744dc9')

build()
{
  cd $srcdir/PyWebDAV-$pkgver
  python2 setup.py install --root=$pkgdir/ 
  install -D doc/LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
