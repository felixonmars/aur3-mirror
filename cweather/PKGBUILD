# Contributor: Xiwen Cheng <x@cinaq.com>

pkgname=cweather
pkgver=1.0
pkgrel=1
pkgdesc="A minimal commandline weather application that uses Google Weather API as content provider"
url="http://www.cinaq.com/"
arch=('any')
license=('GPL')
depends=('xmlstarlet' 'curl')
makedepends=()
conflicts=()
provides=('cweather')
install=cweather.install
changelog=$pkgname.changelog
source=('cweather' 'cweatherrc')
md5sums=('00cd72b8993331a99faaa05d87a0d70e' 'c7c074c6c2323bc4071eb85ffde824e7')

build() {

  cd "${srcdir}"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/cweather" "$pkgdir/usr/bin/cweather"
  install -Dm755 "$srcdir/cweatherrc" "$pkgdir/etc/cweatherrc"
}
