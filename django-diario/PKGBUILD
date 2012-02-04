
pkgname=django-diario
pkgver=0.2
pkgrel=1
pkgdesc="Pluggable weblog application for Django Web Framework"
arch=(any)
url="http://code.google.com/p/django-diario/"
license=('LGPL')
depends=('django') 
source=(http://django-diario.googlecode.com/files/$pkgname-$pkgver-grigoropoulos.tar.gz)
md5sums=('1c1ceafae779ba1cdf48fbd9593189b3')

build() {
  cd $srcdir/$pkgname-$pkgver-grigoropoulos
  python setup.py install --root=$pkgdir
}

