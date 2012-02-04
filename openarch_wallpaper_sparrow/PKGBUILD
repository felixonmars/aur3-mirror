# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_wallpaper_sparrow
pkgver=0.1
pkgrel=2
pkgdesc="Desktop wallpaper sparrow for OpenArch"
arch=('any')
url="http://ovsinc.devaintart.com/"
license=('GPL')
depends=()
optdepends=('nitrogen' 'pcmanfm')
source=('AUTHORS'
	'http://www.deviantart.com/download/190726073/sparrow_wallpaper_by_ovsinc-d35jx6h.zip')

md5sums=('b41b63dfc96d727f0dd7251cb11b61f8'
         'bb9ac57d98e382056f5639b49c1f4e5c')

build() {
	mkdir -p "${pkgdir}"/usr/share/wallpapers
	tar -xf "${srcdir}/sparrow.tar" -C "${pkgdir}"/usr/share/wallpapers
	install -D "${srcdir}/AUTHORS" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/AUTHORS"
}
