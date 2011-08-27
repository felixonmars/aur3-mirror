# Contributor: William Rea <sillywilly@gmail.com>
pkgname=mantissa
pkgver=0.6.16
pkgrel=1
arch=('i686')
license=('custom')
pkgdesc="Mantissa is a multi-protocol application server built on Axiom, Nevow and Twisted"
url="http://divmod.org/trac/wiki/DivmodMantissa"
depends=('twisted' 'axiom' 'nevow' 'python-pytz' 'vertex' 'python-pysqlite')
source=(http://divmod.org/trac/attachment/wiki/SoftwareReleases/Mantissa-$pkgver.tar.gz?format=raw)
md5sums=('c1a77521d1a5af0821e782bbb0f7278b')

build() {
  cd $startdir/src/Mantissa-$pkgver
  python setup.py install --root=$startdir/pkg/ 
  install -D -m644 $startdir/LICENSE $startdir/pkg/usr/share/licences/$pkgname/LICENSE
  rm $startdir/pkg/usr/lib/python2.?/site-packages/axiom/plugins/dropin.cache
}

