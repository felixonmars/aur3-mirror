# Maintainer: bitwave <aur [at] oomlu [d0t] de>
pkgname=pyweb
_pkgver=2.3
pkgver=$_pkgver.2
pkgrel=1
pkgdesc="Literate Programming in pure Python"
arch=(any)
url="http://pywebtool.sourceforge.net/"
license=('GPL')
depends=(python)
provides=(pyweb)
conflicts=(pyweb)
source=("http://downloads.sourceforge.net/project/pywebtool/pyWeb-${_pkgver}/${pkgname}-${pkgver}.tar.gz" pyweb)
sha256sums=('4ffeeb4b3995f3b7652c915a0f6d367808afbc77d094d225c259d8994b96e1d9' '7c61950b2235d41f765a05f8726d1165b023e99853e3152fdaa0cfe42084379b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
  cd "$srcdir"
  install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
