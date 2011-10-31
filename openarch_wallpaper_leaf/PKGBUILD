# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_wallpaper_leaf
pkgver=0.1
pkgrel=2
pkgdesc="Desktop wallpaper leaf for OpenArch"
arch=('any')
url="http://ovsinc.deviantart.com/"
license=('GPL')
depends=()
optdepends=('nitrogen' 'pcmanfm')
source=('AUTHORS'
	'http://www.deviantart.com/download/190741575/leaf_wallpaper_by_ovsinc-d35k953.zip')

build() {
	mkdir -p "${pkgdir}"/usr/share/wallpapers
	tar -xf "${srcdir}/leaf.tar" -C "${pkgdir}"/usr/share/wallpapers
	install -D "${srcdir}/AUTHORS" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/AUTHORS"
}
md5sums=('b41b63dfc96d727f0dd7251cb11b61f8'
         '21f7316046bd6bee35a518bdf818083c')
