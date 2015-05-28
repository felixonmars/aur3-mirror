# Maintainer: Antonio Tauro <eye@eyenx.ch>
_pkgname="tutum"
pkgname="python-tutum-cli"
pkgver="0.15.0.1"
pkgrel="1"
pkgdesc="CLI for Tutum"
arch=("any")
url="https://github.com/tutumcloud/tutum-cli"
license=("Apache")
makedepends=("python-tutum" "python-ago" "python-docker" "python-dateutil" "python-tabulate" "python-yaml" "python")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('399cff8b5b25c1b2fa686d2214ae18dc09c410a070f17fa347b64940c4be0c79')

build(){
    depends=("python-yaml==3.10 python-docker>=1.1.0 python-ago==0.0.6 python-dateutil==2.2 python-tutum>=0.15.0.1 python-tabulate==0.7.2")
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}
package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 
}

