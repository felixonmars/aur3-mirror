# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=kyocera-fs1128mfp
pkgver=8.4
pkgrel=2
pkgdesc="PPD file for Kyocera FS-1128MFP printers"
arch=('any')
url="http://kyocera.hu/letoltesek/tartalom/37101"
license=('custom')
depends=('cups')
optdepends=('system-config-printer: CUPS configuration app')
source=('FS-1128MFP.PPD::http://kyocera.hu/letoltesek/download_manager/37101/118364/'
	'LICENSE')
noextract=('FS-1128MFP.PPD')
sha512sums=('554f27ae9bbef33b2c9344b4674894f29065b2120df6630cebb92feb1a06b71d92a7548778a29b5692ad0b41991f41ec552e90683ce99bf39b506b02d42fc662'
	    '07b969b8efd6b3922d4ea1eb1deb0c13b5c3645492b1ac3db669b99798031ada43131e3cbc69d045ad4c7f49dc325412840cc1a4981b9a2b394a6c90d7db39ea')

package() {
	cd "$srcdir/"
	install -D "FS-1128MFP.PPD" "${pkgdir}/usr/share/cups/model/Kyocera/Kyocera_FS-1128MFP.PPD"
	install -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
