# Contributor: Patrick Schneider <patrick.schneider@uni-ulm.de>
pkgname=django-rosetta
pkgver=0.6.0
pkgrel=1
pkgdesc="A Django application that eases the translation process of your Django projects"
arch=('i686' 'x86_64')
url="http://code.google.com/p/django-rosetta/"
license=('MIT')
depends=('django')
makedepends=('setuptools')
source=(http://django-rosetta.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('d5462fe9d92fb73c0931eafe79133ab2')

build() { 
    cd "$srcdir/$pkgname-$pkgver"
    
    python2 setup.py build || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    python2 setup.py install --root=$pkgdir || return 1
}

