pkgname=django-recaptcha-works
pkgver=0.3.4
pkgrel=1
pkgdesc="django-recaptcha-works provides a Django form field that integrates the reCaptcha service."
arch=('any')
url="http://www.codetrax.org/projects/django-recaptcha-works"
license=('BSD')
depends=('django')
source=(http://pypi.python.org/packages/source/d/$pkgname/$pkgname-$pkgver.tar.gz)

build() { 
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir --install-data=/usr/share/$pkgname || return 1
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('fbe17c468dd56c826a15376d50b32d10')
