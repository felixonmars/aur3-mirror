# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=alephone-red
pkgver=1.0
pkgrel=1
pkgdesc="An AlephOne scenario set in a dark alternate version of the Marathon universe"
arch=('any')
url="http://trilogyrelease.bungie.org/"
license=('unknown')
depends=('alephone')
source=(http://trilogyrelease.bungie.org/files/MarathonRED.zip \
	$pkgname.sh)
md5sums=('a6b2318e1e1d52230faf6656c694e7b7'
         'd12b63633e60e45738519d9df37e7dd5')

build() {
  find "Marathon RED" -type f -exec chmod 644 {} \;

  mkdir -p "$pkgdir"/usr/share/alephone/scenarios
  cp -rf "Marathon RED"/ "$pkgdir"/usr/share/alephone/scenarios/red/

  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
