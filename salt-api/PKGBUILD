# Maintainer: Christer Edwards <christer.edwards@gmail.com>

pkgname=salt-api
pkgver=0.8.3
pkgrel=1
pkgdesc="Salt API is used to expose the fundamental aspects of Salt control to external sources."
arch=(any)
url="https://github.com/saltstack/salt-api"
license=("APACHE")
depends=('salt')
optdepends=('python2-cherrypy: rest_cherrypy interface')

source=("http://pypi.python.org/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        salt-api.service)

sha256sums=('11e834678224ee1393c7a272cb5fc11c532d46deb202631c5d56b1badd2c6a40'
            '31e0367390ec221a97b46e4f9b43d93bf552a35bdd7fc0534fcf8b3ab49dbffd')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py build
	chmod a+r doc/man/*
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 "$srcdir/salt-api.service" "$pkgdir/usr/lib/systemd/system/salt-api.service"
}

