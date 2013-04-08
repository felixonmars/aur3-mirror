# Maintainer: Mark Coolen <mark dot coolen at gmail dot com>

pkgname=yogurt
pkgver=1.0
pkgrel=1
url=('http://aur.archlinux.com/packages/yogurt/')
pkgdesc="The English version of yaourt"
arch=('any')
license=('Free')
depends=('yaourt')

package() {
	mkdir -p "$pkgdir/usr/bin/"
	ln -s /usr/bin/yaourt "$pkgdir/usr/bin/yogurt"
}
