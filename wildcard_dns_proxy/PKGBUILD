pkgname=('wildcard_dns_proxy')
pkgver=1
pkgrel=1
pkgdesc="A proxying wildcard dns server in Python"
arch=('any')
url="http://github.com/realgeeks/wildcard_dns_proxy"
license=('BSD')
depends=('python2-distribute')
source=("https://github.com/RealGeeks/wildcard_dns_proxy/zipball/master"
	"wildcard_dns_proxy.service"
)
md5sums=('79b9b452aa19e8172f75c7378dc62818'
         'd83f31c98c8ddacc4c05c9d93af14229')

githash="215794c"

build() {
	cd "$srcdir/RealGeeks-wildcard_dns_proxy-$githash"
	find -type f -name "*.py" -exec sed -i 's|/usr/bin/env python|/usr/bin/env python2|' {} \;
	python2 setup.py install -O1 --prefix=/usr --root="$pkgdir"
}

package() {
        install -Dm644 "$srcdir/wildcard_dns_proxy.service" "$pkgdir/usr/lib/systemd/system/wildcard_dns_proxy.service"
	cd "$srcdir/RealGeeks-wildcard_dns_proxy-$githash"
}
