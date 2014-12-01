# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=xbmc-texturecache
_pkgname=texturecache.py
pkgver=1.8.4
pkgrel=1
pkgdesc="Utility to manage the XBMC texture cache and more."
arch=('any')
url="https://github.com/MilhouseVH/texturecache.py"
license=('GPL')
depends=('python' 'xbmc')
install=readme.install
source=("https://github.com/MilhouseVH/${_pkgname/%%.py}/archive/$pkgver.tar.gz")
sha256sums=('f3aeedac6f4bf04ba4c4cfafe0a7fb51b5437e0ff3faa6374c7807153e67595b')

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/texturecache"
	install -Dm644 "texturecache.cfg.defaults" "$pkgdir/usr/share/texturecache/texturecache.cfg"
}
