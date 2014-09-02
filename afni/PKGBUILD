# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>
pkgname=afni
pkgver=2011_12_21_1014
pkgrel=1
pkgdesc="An open-source environment for processing and displaying functional MRI data"
arch=("i686" "x86_64")
url="http://afni.nimh.nih.gov"
license=(custom)
depends=("tcsh" "python" "gcc-libs" "gsl" "libxpm" "glu" "lesstif" "libjpeg-turbo" "libxmu" "libxft")
source=("http://afni.nimh.nih.gov/pub/dist/tgz/afni_src.tgz" "Makefile.patch")
sha1sums=('c61f6bc6c3adcda121e2483b24fb397ae69fe80e' '8a7bbd0d909649a32663112612c2bec9003b75b4')

build() {	

	cd ${srcdir}/afni_src

	cp Makefile.linux_openmp_64 Makefile

	patch Makefile < ../Makefile.patch

	if [[ "$CARCH" == 'i686' ]]; then
		sed -i 's^-m64^-m32^g' Makefile
	fi

	MAKEFLAGS="" CPPFLAGS="" make

}
package(){

	mkdir -p $pkgdir/opt
	cp -r $srcdir/build $pkgdir/opt/afni
	find $pkgdir/opt/afni -name \*.a -delete
	find $pkgdir/opt/afni -name \*.h -delete

	mkdir -p $pkgdir/usr/share/licenses/afni
	cp $srcdir/afni_src/README.copyright $pkgdir/usr/share/licenses/afni/LICENSE

}
