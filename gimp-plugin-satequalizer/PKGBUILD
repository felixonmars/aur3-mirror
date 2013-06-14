# Contributor: Tibor Bamhor <tiborb95 at gmail.com>

pkgname=gimp-plugin-satequalizer
pkgver=0.9.1
pkgrel=1
pkgdesc="Saturation equalizer. 6-bands equalizer, brightness adjustment, auto white calibration and more."
url="http://code.google.com/p/satequalizer/"
license="GPL-3"
arch=('i686' 'x86_64')
depends=(gimp)
#makedepends=()
source=(http://satequalizer.googlecode.com/files/satequalizer-$pkgver.tgz)



build() {

	#defining variables
	work_dir=$srcdir/satequalizer/  
	
	cd $work_dir
	
	#to fix problem: undefined reference to symbol 'pow@@GLIBC_2.0'
	export LDFLAGS="$LDFLAGS -lm"
	
	#compiling
	gimptool-2.0  --build saturate.c || exit 1
	}

package() {
	#copying compiled binary into pkgdir to be packed
	mkdir -p ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
	install -m 755 ${srcdir}/satequalizer/saturate ${pkgdir}/usr/lib/gimp/2.0/plug-ins/ 
	
	}

sha1sums=('a40b0fc917eaaea24514339d459b8367063e6aac') 
