# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_wallpaper_cat
pkgver=0.1
pkgrel=2
pkgdesc="Desktop wallpaper cat for OpenArch"
arch=('any')
url='http://ovsinc.deviantart.com/art/cat-wallpaper-192915873'
license=('custom')
depends=()
optdepends=('nitrogen' 'pcmanfm')
source=('AUTHORS'
	'http://www.deviantart.com/download/192915873/cat_wallpaper_by_ovsinc-d36uuu9.zip')

build() {
	mkdir -p "${pkgdir}"/usr/share/wallpapers
	tar -xf "${srcdir}/cat.tar" -C "${pkgdir}"/usr/share/wallpapers
	install -D "${srcdir}/AUTHORS" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/AUTHORS"
}
md5sums=('8dd9bdfa2443f68de091372fbba65365'
         '3c0e3c2f1be09edafccbd207dc572e7d')
