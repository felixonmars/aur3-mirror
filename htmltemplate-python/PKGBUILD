# Contributor: Nathan Owe. <ndowens04 at gmail>

pkgname=htmltemplate-python
pkgver=1.5.0
pkgrel=1
pkgdesc="converts HTML/XHTML templates into simple Python-based object models"
arch=('any')
url="http://py-templates.sourceforge.net/"
source=(http://pypi.python.org/packages/source/H/HTMLTemplate/HTMLTemplate-1.5.0.tar.gz)
license=('MIT')
md5sums=('c6f3f9d00373319df1ddb4b94327d0a7')
depends=('python')
options=(!emptydirs)

build() {
  cd $srcdir/HTMLTemplate-$pkgver
  python setup.py install --root=$pkgdir/
  install -D -m644 $startdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


