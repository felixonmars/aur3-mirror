# Maintainer: Antonio Tauro <eye@eyenx.ch>

pkgname="python-tutum"
pkgver="0.15.0.1"
pkgrel="1"
pkgdesc="Python Library for Tutum"
arch=("any")
url="https://github.com/tutumcloud/python-tutum"
license=("Apache")
makedepends=("python-future" "python-requests" "python-websocket-client" "python")
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('42f309124859d13b3edb2d604ee316c27bbe0c4708e2807a8f67262f9bdc68a4')

build(){
    depends=("python-requests>=2.5.3" "python-future=0.14.3" "python-websocket-client>=0.11.0")
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 
}

