# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=hwhisper
pkgver=0.3.2
pkgrel=1
pkgdesc="Hamster Whisper is a script editor for Plotscripting on ohrrpgce."
arch=(any)
url="http://rpg.hamsterrepublic.com/ohrrpgce/Hamster_Whisper"
license=('GPL2')
depends=('ohrrpgce' 'pygtk' 'python2')
source=(http://huulivoide.pp.fi/Arch/$pkgname-$pkgver.tar.xz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

	mkdir -p "${pkgdir}"/usr/{share/{applications,hwhisper},bin}

	cp hwhisper.sh "${pkgdir}"/usr/bin/hwhisper
	chmod +x "${pkgdir}"/usr/bin/hwhisper
	cp hamsterspeak.lang hwhisper.{py,svg,xml} {undobuffer,version}.py \
		"${pkgdir}"/usr/share/hwhisper/
	cp hwhisper.desktop "${pkgdir}"/usr/share/applications/
}
# vim:set ts=2 sw=2 et:
md5sums=('3c7ac43383cfbf53c58e20fa0a6e0dec')
