# Maintainer: Kevin Cox <kevincox.ca@gmail.com>

pkgname=steam-closetotray
pkgver=1.0
pkgrel=1
pkgdesc="Sets the steam main window to close to the system tray."
arch=('any')

url="https://example.org"
license=('MIT')

source=('steam-closetotray.sh')
sha1sums=('09b863c2eda3573f5bfc75bc2483f1674e75473c')

depends=()
conflicts=()

build()
{
	install -Dm 775 "$srcdir/steam-closetotray.sh" "$pkgdir/etc/profile.d/steam-closetotray.sh"
}
