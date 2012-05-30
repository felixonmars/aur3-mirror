# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=ttf-kuppel
pkgver=1.0
pkgrel=4
pkgdesc="Kuppel fonts by Kimmy Kirkwood"
arch=('any')
url="http://kimmydesign.com/"
license=("custom: free")
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=${pkgname}.install

source=("kuppel-${pkgver}-${pkgrel}.zip::http://kimmydesign.com/v1/projects/kuppel.zip")

build() {
	cd "${srcdir}/"
	install -m755 -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 ./kuppel/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

md5sums=('31fc1a1b0eadce9ba1f592ed8274e566')
