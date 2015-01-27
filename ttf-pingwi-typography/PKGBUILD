# Maintainer: shahid <helllamer@gmail.com>

## 2015.01.26: Looks like, pingwinsoft is dead. Site is unavailable.
## Fonts recovered and pushed inside PKGBUILD distibution.

pkgname=ttf-pingwi-typography
pkgver=20100604
pkgrel=1
pkgdesc="PingWi Typography (PWT) fonts"
arch=('any')
license=('custom')
url="http://www.pingwinsoft.ru/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=pwt.install
source=('PWTArionTSTBoldItalic.ttf'
	'PWTArionTSTBold.ttf'
	'PWTArionTSTItalic.ttf'
	'PWTArionTST.ttf'
	'PWTCourantTST.ttf'
	'PWTTahionTSTBold.ttf'
	'PWTTahionTST.ttf'
	'PWTTimerTSTBold.ttf'
	'PWTTimerTSTItalic.ttf'
	'PWTTimerTST.ttf'
	'PWTVerdeTSTBold.ttf'
	'PWTVerdeTSTItalic.ttf'
	'PWTVerdeTST.ttf'
	'license_test.doc')

md5sums=('7e66ec37e82609d79d89080a7d4b4773'
	'0023e38f4ef0165dbd388e8acb9dd0ee'
	'c9e0ed68a393c540e82ac2c05da48649'
	'f949a296a1a0819aec67e012a5a2dce2'
	'ff8245bc6d80d3c26fd7c001c53831a1'
	'506fc0a48a5260fd9b5096a42547cb3d'
	'446a7833e75d0923a8faa2e4a13486a6'
	'8b76983c96bec6775f98eee92c7bf1b3'
	'5b9c8aa733474e07b27c15ba6165cc3f'
	'61756a824f8681727b5dd8d4abd674e6'
	'0e55eab67d5a1593fb16eb68b065c688'
	'4f0e45e3d0b3e704576db4f89bcc1e22'
	'a5c068d273f0cf7729dea0ac4a580bef'
	'bb9b15f77d3df2452c26e6f51f9c291b')

package() {
  mkdir -p ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 license_test.doc ${pkgdir}/usr/share/licenses/${pkgname}/license.doc
}

