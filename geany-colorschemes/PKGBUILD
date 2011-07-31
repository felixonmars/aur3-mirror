# Contributor: Todd Partridge (Gen2ly) toddrpartridge (at) gmail

pkgname=geany-colorschemes
pkgver=1
pkgrel=2
pkgdesc="Various Geany colorschemes"
arch=('any')
url='http://www.geany.org/Download/Extras#colors'
license=('GPL2' '')
depends=('geany')
install=${pkgname}.install
source=('http://geany-dark-scheme.googlecode.com/files/geany_dark_filedefs_20100304_190847.tar.bz2'
				'http://geany-vibrant-ink-theme.googlecode.com/files/vibrant_ink_geany_filedefs_20100207.tar.gz'
				'http://www.barryvan.com.au/geany/geany-darkTango.zip'
				'http://download.geany.org/contrib/oblivion2.tar.gz')
noextract=('geany_dark_filedefs_20100304_190847.tar.bz2'
					 'vibrant_ink_geany_filedefs_20100206.tar.gz'
					 'geany-darkTango.zip'
					 'oblivion2.tar.gz')
md5sums=('c1e0ab3033e9847ad85d310c91a39e38'
         '0230e96b4c974dd077f495cb754720a0'
         'fb0a8d2f57c06d4f5328d0f95f89b317'
         '70f64c90dec3521e68c469f568cb2749')


build() {

	# Extract each file into it's own folder
	cd "$srcdir/"
	msg "Extracting colorschemes..."
	mkdir geany-dark-color-scheme geany-vibrant-ink geany-dark-tango geany-oblivion-2
	bsdtar -xf geany_dark_filedefs_20100304_190847.tar.bz2 -C geany-dark-color-scheme
	bsdtar xf vibrant_ink_geany_filedefs_20100207.tar.gz -C geany-vibrant-ink
	bsdtar xf geany-darkTango.zip -C geany-dark-tango
	bsdtar xf oblivion2.tar.gz -C geany-oblivion-2

	# Create file system folders
	install -d ${pkgdir}/usr/share/
	
	# Install files
	cp -r geany-dark-color-scheme geany-vibrant-ink geany-dark-tango geany-oblivion-2 ${pkgdir}/usr/share/
	
	# Create proper permissions
	chmod -R 644 ${pkgdir}/usr/share/geany-*

}
