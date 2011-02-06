# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname='linuxdsp-jackgtk'
pkgver=1
pkgrel=3
pkgdesc="JACK GTK linuxDSP audio processing software applications."
arch=('i686' 'x86_64')
url="http://www.linuxdsp.co.uk/"
license=('Non-Commercial' 'Non-Free' 'Gratis')
depends=('jack')
install='linuxdsp-jackgtk.install'

source=('http://www.linuxdsp.co.uk/download/jack/download_sr_2a_jack/sr-2a.zip' \
	'http://www.linuxdsp.co.uk/download/jack/download_ch_eq2_jack/ch-eq2.zip' \
	'http://www.linuxdsp.co.uk/download/jack/download_gr_eq2_jack/gr-eq2.zip'\
	'http://www.linuxdsp.co.uk/download/jack/download_vc2_jack/vc2.zip' \
	'http://www.linuxdsp.co.uk/download/jack/download_odv2_jack/odv2.zip' \
	'http://www.linuxdsp.co.uk/download/jack/download_jp1_jack/jp1.zip' \
	'http://www.linuxdsp.co.uk/download/guitar_fx/ph1/ph1.zip' \
	'http://www.linuxdsp.co.uk/download/guitar_fx/st1/st1.zip' \
	'http://www.linuxdsp.co.uk/download/guitar_fx/dt1/dt1.zip')

md5sums=('e5f9a1286af1bb74064215dafc451fc6' \
	'27970a3f5c8327700e146eee07c2a470' \
	'b2442238e3ded98411e2269bdec82f86' \
	'367dbef383fd8da050033e54f8e27207' \
	'a1edcd070b7051271744cf436ca34385' \
	'3c7e431b52f028c072ce58568789d28f' \
	'b82519c7f87f767b8f7f666b70dc3ac8' \
	'da889cba82d3145693c5eb38820ddb4a' \
	'f1019a4e6e497f493d415db688e0e6cd')

build()
{
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/doc/linuxdsp"

 	if [ "$CARCH" == "x86_64" ]; then
		cp "${srcdir}/SR-2A/x86_64/sr-2a_x86-64" "${pkgdir}/usr/bin/sr-2a"
		cp "${srcdir}/CH-EQ2/x86_64/ch-eq2_x86-64" "${pkgdir}/usr/bin/ch-eq2"
		cp "${srcdir}/GR-EQ2/x86_64/gr-eq2_x86-64" "${pkgdir}/usr/bin/gr-eq2"
		cp "${srcdir}/VC2/x86_64/vc2_x86-64" "${pkgdir}/usr/bin/vc2"
		cp "${srcdir}/ODV2/x86_64/odv2_x86-64" "${pkgdir}/usr/bin/odv2"
		cp "${srcdir}/JP1/x86_64/jp1_x86-64" "${pkgdir}/usr/bin/jp1"
		cp "${srcdir}/PH-1/x86-64/ph1_x86-64" "${pkgdir}/usr/bin/ph1"
		cp "${srcdir}/ST-1/x86-64/st1_x86-64" "${pkgdir}/usr/bin/st1"
		cp "${srcdir}/DT-1/x86-64/dt1_x86-64" "${pkgdir}/usr/bin/dt1"
 	else
		cp "${srcdir}/SR-2A/sr-2a_i686" "${pkgdir}/usr/bin/sr-2a"
		cp "${srcdir}/CH-EQ2/ch-eq2_i686" "${pkgdir}/usr/bin/ch-eq2"
		cp "${srcdir}/GR-EQ2/gr-eq2_i686" "${pkgdir}/usr/bin/gr-eq2"
		cp "${srcdir}/VC2/vc2_i686" "${pkgdir}/usr/bin/vc2"
		cp "${srcdir}/ODV2/odv2_i686" "${pkgdir}/usr/bin/odv2"
		cp "${srcdir}/JP1/jp1_i686" "${pkgdir}/usr/bin/jp1"
		cp "${srcdir}/PH-1/ph1_i686" "${pkgdir}/usr/bin/ph1"
		cp "${srcdir}/ST-1/st1_i686" "${pkgdir}/usr/bin/st1"
		cp "${srcdir}/DT-1/dt1_i686" "${pkgdir}/usr/bin/dt1"

 	fi

# Manuals
	cp "${srcdir}/SR-2A/manual.pdf" "${pkgdir}/usr/share/doc/linuxdsp/sr-2a.pdf"
	cp "${srcdir}/CH-EQ2/manual.pdf" "${pkgdir}/usr/share/doc/linuxdsp/ch-eq2.pdf"
	cp "${srcdir}/GR-EQ2/manual.pdf" "${pkgdir}/usr/share/doc/linuxdsp/gr-eq2.pdf"
	cp "${srcdir}/VC2/manual.pdf" "${pkgdir}/usr/share/doc/linuxdsp/vc2.pdf"
	cp "${srcdir}/ODV2/manual.pdf" "${pkgdir}/usr/share/doc/linuxdsp/odv2.pdf"
	cp "${srcdir}/JP1/manual.pdf" "${pkgdir}/usr/share/doc/linuxdsp/jp1.pdf"
	cp "${srcdir}/PH-1/manual.pdf" "${pkgdir}/usr/share/doc/linuxdsp/ph1.pdf"
	cp "${srcdir}/ST-1/manual.pdf" "${pkgdir}/usr/share/doc/linuxdsp/st1.pdf"
	cp "${srcdir}/DT-1/manual.pdf" "${pkgdir}/usr/share/doc/linuxdsp/dt1.pdf"
}