# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=spm8
pkgver=5236
pkgrel=1
pkgdesc="A MATLAB package for analysis of fMRI, PET, SPECT, EEG and MEG brain imaging sequences."
arch=('any')
license=('GPL2')
depends=()
optdepends=('fieldtrip')
url="http://www.fil.ion.ucl.ac.uk/spm/"
source=('ftp://ftp.fil.ion.ucl.ac.uk/spm/restricted/idyll/spm8.zip'
	'ftp://ftp.fil.ion.ucl.ac.uk/spm/spm8_updates/spm8_updates_r5236.zip')
sha1sums=('924b4485e8d2e92e75f047cb8bd814470beb5a7e'
	  'bc721005db71fd6a38c26d61fd718318b5397f21')
noextract=('spm8.zip'
	   'spm8_updates_r5236.zip')
build() {

	cd "${srcdir}"
	unzip ../spm8.zip
	cd "${srcdir}/spm8"
	unzip -o ../../spm8_updates_r5236.zip
	rm -r "${srcdir}/spm8/external/fieldtrip"
}

package() {

	mkdir -p "${pkgdir}/opt"
	cp -r "${srcdir}/spm8" "${pkgdir}/opt/"

}
