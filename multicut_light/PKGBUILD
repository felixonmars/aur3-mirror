# Maintainer: Max Roder <maxroder@web.de>
# Contributor: Vinzenz Vietzke <vinz@archlinux.us>

pkgname='multicut_light'
pkgver='20100518'
pkgrel='3'
pkgdesc='Bash script to cut recordings from onlinetvrecorder.com'
url='http://cutlist.at/tools/'
arch=('any')
license=('unknown')
depends=('bash' 'bc' 'avidemux' 'otrdecoder' 'mencoder')
optdepends=('dialog: Change filenames using the script'
			'mkvtoolnix-cli: Convert HQ videos to mkv'
			'mplayer: View video file after cutting')
source=("${pkgname}_${pkgver}.sh")
sha256sums=('ea96eeb46356edad7a955bc5d0769ed5a86ad4d7c7ea9bc07f731e457f3c02ad')

package() {
	install -D -m755 ${srcdir}/${pkgname}_${pkgver}.sh ${pkgdir}/usr/bin/multicut_light || return 1
}

# vim:set ts=2 sw=2 et:
