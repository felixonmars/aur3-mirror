# Maintainer: felix <at yandex dot com, local part is isaev, preceded by m dot p dot>
pkgbase=unifont
pkgname=(
	ttf-unifont
	pcf-unifont
	bdf-unifont
	psf-unifont
	unifont-utils
)
pkgver=7.0.06
pkgrel=1
epoch=
pkgdesc="A free bitmap font with wide Unicode support (split package with accompanying utilities, TrueType, PCF and BDF versions)"
arch=(i686 x86_64)
url="http://unifoundry.com/"
license=('GPL2')
groups=()
depends=()
makedepends=('perl')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"http://unifoundry.com/pub/unifont-$pkgver/unifont-$pkgver.tar.gz"
	"http://unifoundry.com/pub/unifont-$pkgver/unifont-$pkgver.tar.gz.sig"
	fontconfig-avoid-eye-strain.conf
	fontconfig-upper.conf
	ttf.install
)
noextract=()
sha512sums=('c53f47d11673c8856a7efd410819c845bc25273f4ddc1a535d59253342b319d53b8336ef97b5ec01cbbf3d2596ab7138c4a03d1302bfda70a3f7e1796f412447'
            'SKIP'
            '5c7b8603669125f225ae1c05e72529d019528f8eac09d71e5f7a8ecb28c525038c453c8b9b1c9b10133762c5593eadedad0771f72bb731b7c023a0c4648c18a3'
            '4eb2703bea9af264a8beac2f7605666f7a96a7a36a06dcd4357ad77c99378d99a266aeb54b79bd14a7718a3ceddd8a44b2d4d44e442c02ff4e6cb6f4035cd6a8'
            'f1756a6af6976a5a4af6f9a0aebf9740a3a6525f1e2801610c248c762f745ef73c2adb6c38260c9c036f7b8755f419ac0af55982087d64643222fd1cfeedb297')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33')

_use_precompiled=1 # comment out to build the font from .hex files

### build instructions

_compiled="${_use_precompiled:+pre}compiled"

_wanted() {
	for _item in "${pkgname[@]}"; do
		[[ "$_item" = "$1" ]] && return 0
	done
	return 1
}

if [[ -z "$_use_precompiled" ]]; then
	_wanted pcf-unifont && makedepends+=(xorg-bdftopcf)
	_wanted ttf-unifont && makedepends+=(fontforge)
	_wanted psf-unifont && makedepends+=(bdf2psf)
fi

build() {
	cd "$srcdir/unifont-$pkgver"
	make -j1 distclean
	make -j1 clean

	cd "$srcdir/unifont-$pkgver/src"
	msg2 "Building utilities"
	make -j1
	
	cd "$srcdir/unifont-$pkgver/font"
	if _wanted bdf-unifont; then
		# always building it, because the _csur variants
		# are missing in the precompiled font
		msg2 "Building the BDF version"
		make -j1 bdf -o distclean
	fi
	
	if [[ -z "$_use_precompiled" ]]; then
		if _wanted psf-unifont; then
			msg2 "Building the PSF version"
			make -j1 psf -o distclean
		fi
		if _wanted pcf-unifont; then
			msg2 "Building the PCF version"
			make -j1 pcf -o distclean
		fi
		if _wanted ttf-unifont; then
			msg2 "Building the TTF version" 
			make -j1 ttf csurttf upperttf uppercsurttf -o distclean
		fi
	fi
}

# warning: below i pretty much bypass the whole build system,
# because it's not flexible enough to handle this kind of packaging

package_ttf-unifont() {
	pkgdesc="A free bitmap font with wide Unicode support (TrueType version)"
	provides=(ttf-unifont ttf-unifont-csur)
	arch=(any)
	install=ttf.install
	
	_ttfdir=/usr/share/fonts/TTF

	cd "$srcdir/unifont-$pkgver/font/$_compiled"
	install -D -m0644 "unifont-${pkgver}.ttf" \
		"${pkgdir}${_ttfdir}/unifont.ttf"
	install -D -m0644 "unifont_csur-${pkgver}.ttf" \
		"${pkgdir}${_ttfdir}/unifont_csur.ttf"
	install -D -m0644 "unifont_sample-${pkgver}.ttf" \
		"${pkgdir}${_ttfdir}/unifont_sample.ttf"
	install -D -m0644 "unifont_upper-${pkgver}.ttf" \
		"${pkgdir}${_ttfdir}/unifont_upper.ttf"
	install -D -m0644 "unifont_upper_csur-${pkgver}.ttf" \
		"${pkgdir}${_ttfdir}/unifont_upper_csur.ttf"

	cd "$srcdir"
	install -D -m0644 fontconfig-avoid-eye-strain.conf \
		"$pkgdir/etc/fonts/conf.avail/20-unifont-noaa.conf"
	install -D -m0644 fontconfig-upper.conf \
		"$pkgdir/etc/fonts/conf.avail/20-unifont-upper.conf"
}

package_pcf-unifont() {
	pkgdesc="A free bitmap font with wide Unicode support (PCF version)"
	provides=(pcf-unifont)
	arch=(any)
	
	_pcfdir=/usr/share/fonts/misc

	cd "$srcdir/unifont-$pkgver/font/$_compiled"
	install -D -m0644 "unifont-${pkgver}.pcf.gz" \
		"${pkgdir}${_pcfdir}/unifont.pcf.gz"
	install -D -m0644 "unifont_csur-${pkgver}.pcf.gz" \
		"${pkgdir}${_pcfdir}/unifont_csur.pcf.gz"
	install -D -m0644 "unifont_sample-${pkgver}.pcf.gz" \
		"${pkgdir}${_pcfdir}/unifont_sample.pcf.gz"
}

package_bdf-unifont() {
	pkgdesc="A free bitmap font with wide Unicode support (BDF version)"
	arch=(any)

	_bdfdir=/usr/share/fonts/misc

	# always use the compiled version, see build() above
	cd "$srcdir/unifont-$pkgver/font/compiled"
	install -D -m0644 "unifont-${pkgver}.bdf.gz" \
		"${pkgdir}${_bdfdir}/unifont.bdf.gz"
	install -D -m0644 "unifont_csur-${pkgver}.bdf.gz" \
		"${pkgdir}${_bdfdir}/unifont_csur.bdf.gz"
	install -D -m0644 "unifont_sample-${pkgver}.bdf.gz" \
		"${pkgdir}${_bdfdir}/unifont_sample.bdf.gz"
}

package_psf-unifont() {
	pkgdesc="A free bitmap font with wide Unicode support (PSF version, for APL)"
	arch=(any)
	
	cd "$srcdir/unifont-$pkgver/font/$_compiled"
	install -D -m 0644 "Unifont-APL8x16-${pkgver}.psf.gz" \
		"${pkgdir}/usr/share/kbd/consolefonts/Unifont-APL8x16.psf.gz"
}

package_unifont-utils() {
	pkgdesc="A free bitmap font with wide Unicode support - utilities"
	depends=('perl')
	optdepends+=('perl-wx: for the unifont-viewer utility')
	arch=(i686 x86_64)

	cd "$srcdir/unifont-$pkgver/src"
	make install PREFIX="$pkgdir/usr"
	cd "$srcdir/unifont-$pkgver/man"
	make install PREFIX="$pkgdir/usr" COMPRESS=1
}
