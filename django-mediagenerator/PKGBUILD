pkgname=django-mediagenerator
pkgver=1.11
pkgrel=1
pkgdesc="Asset manager for Django"
arch=('any')
url="http://www.allbuttonspressed.com/projects/django-mediagenerator"
license=('BSD')
depends=('django')
source=(http://pypi.python.org/packages/source/d/$pkgname/$pkgname-$pkgver.zip)

build() { 
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir --install-data=/usr/share/$pkgname || return 1
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('61aa569f696c75af5b5e6943b1475d01')
