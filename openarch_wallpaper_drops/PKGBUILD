# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_wallpaper_drops
pkgver=0.1
pkgrel=2
pkgdesc="Desktop wallpaper drops  for OpenArch"
arch=('any')
url="http://ovsinc.deviantart.com/"
license=('GPL')
depends=()
optdepends=('nitrogen' 'pcmanfm')
source=('AUTHORS'
	'http://www.deviantart.com/download/190749650/drops_wallpaper_by_ovsinc-d35kfde.zip')

build() {
	mkdir -p "${pkgdir}"/usr/share/wallpapers
	tar -xf "${srcdir}/drops.tar" -C "${pkgdir}"/usr/share/wallpapers
	install -D "${srcdir}/AUTHORS" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/AUTHORS"
}
md5sums=('b41b63dfc96d727f0dd7251cb11b61f8'
         '3442b34d77059a416d4a2aff091449f0')
