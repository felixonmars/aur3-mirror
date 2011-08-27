# Contributor: Chaiwat Suttipongsakul <cwt at bashell dot com>
pkgname=django-satchmo
pkgver=0.9.1
pkgrel=1
pkgdesc="Online shop in Django"
arch=(any)
url="http://satchmoproject.com/"
license=('BSD')
depends=('python2' 'django')
source=(http://bitbucket.org/chris1610/satchmo/get/v$pkgver.tar.bz2)
md5sums=('b3b03141231d082286f5797823b6ea4a')

build() { 
    cd "$srcdir/satchmo"
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir --optimize=1 || return 1
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
