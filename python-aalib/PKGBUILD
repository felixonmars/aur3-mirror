# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=python-aalib
pkgver=0.2
pkgrel=1
pkgdesc="Python bindings for AAlib"
arch=('any')
url="http://jwilk.nfshost.com/software/python-aalib.html"
license=("GPL2")
depends=('python2' 'aalib' 'pil')
changelog='ChangeLog'
source=(http://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('675b06ed50418bd8c36ccf88334585ef')

build() {
  :
}

package() {
  cd $srcdir/${pkgname}-$pkgver
  python2 setup.py install --root=$pkgdir
}
