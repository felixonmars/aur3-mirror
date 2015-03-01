# Maintainer: Enric Morales <aur@enric.me>
# Contributor: farnsworth517 <hikmet1517[at]gmail[dot]com>
# Contributor: mutlu_inek <mutlu_inek@yahoo.de>
# Contributor: <cheesinglee@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=ttf-sil-doulos
pkgver=5.000
pkgrel=2
pkgdesc='Doulos SIL is a serif typeface developed by SIL International, very similar to Times or Times New Roman.'
arch=('any')
url="http://scripts.sil.org/cms/scripts/page.php?item_id=DoulosSIL"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-sil-fonts' 'ttf-google-fonts-git' 'ttf-google-fonts-hg')
replaces=('doulos-sil')
install=${pkgname}.install
source=('doulos.zip::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=DoulosSIL-5.000.zip&filename=DoulosSIL-5.000.zip')
md5sums=('9c27d4fa550db23430ace3222fd14f6a')

package() {
	cd "${srcdir}/DoulosSIL-5.000/"

	# Font installation
	install -d "${pkgdir}/usr/share/fonts/TTF"
	install -Dm644 "DoulosSIL-R.ttf" "${pkgdir}/usr/share/fonts/TTF"

	# License installation
	install -d "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 documentation/* "${pkgdir}/usr/share/doc/${pkgname}/"

	# License installation
	install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
