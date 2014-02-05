# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=fieldtrip-git
pkgver=r8588.r594.ge3cac84
pkgrel=1
pkgdesc="A Matlab software toolbox for MEG and EEG analysis."
arch=('i686' 'x86_64')
license=('GPL2')
provides=('fieldtrip')
depends=('fltk' 'make' 'java-environment')
if [[ "$CARCH" == 'i686' ]]; then
	depends+=('gcc-libs' 'libxft' 'libxext' 'ncurses')
else
	depends+=('gcc-libs-multilib' 'lib32-libxft' 'lib32-libxext' 'lib32-ncurses')
fi
optdepends=('spm8' 'suitesparse')
url="http://fieldtrip.fcdonders.nl/"
source=('git://github.com/fieldtrip/fieldtrip.git')
sha1sums=('SKIP')
	   
pkgver() {
	cd "${srcdir}/fieldtrip"
	git describe --long | sed -E 's/^foo-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	
	cd "${srcdir}/fieldtrip/realtime/src"
	find . -name \*.cc -exec sed -i "s^#include <Fl/^#include <FL/^g" "{}" \;
	find . -name \*.cc -exec sed -i "s^#include <FL/\(.*\).h>^#include <FL/\1.H>^g" "{}" \;
	./rebuild.sh clean
	./rebuild.sh all

	cd "${srcdir}/fieldtrip/peer/src"
	make

	cd "${srcdir}/fieldtrip/external/vgrid"
	make

}

package() {

	# Remove Windows stuff and things covered by other packages
	rm -r "${srcdir}/fieldtrip/external/spm2"
	rm -r "${srcdir}/fieldtrip/external/spm8"
	rm -r "${srcdir}/fieldtrip/peer/src/win32"
	rm -r "${srcdir}/fieldtrip/realtime/bin/win32"
	rm -r "${srcdir}/fieldtrip/realtime/bin/raspberrypi"
	rm -r "${srcdir}/fieldtrip/realtime/src/buffer/src/win32"
	rm -r "${srcdir}/fieldtrip/realtime/src/external/pthreads-win32"
	rm -r "${srcdir}/fieldtrip/realtime/src/external/pthreads-win64"
	rm -r "${srcdir}/fieldtrip/realtime/src/acquisition/tobi/lib/ticpp/win"
	rm -r "${srcdir}/fieldtrip/external/dmlt/external/gpstuff/SuiteSparse"

	# Remove object files
	find "${srcdir}/fieldtrip" -name \*.o -exec rm "{}" \;
	
	# Remove files for other architectures
	rm -r "${srcdir}/fieldtrip/realtime/bin/"*"mac"* 
	find "${srcdir}/fieldtrip" -name \*.mex\* -exec rm -v "{}" \;
	find "${srcdir}/fieldtrip" -name \*.hpux -exec rm -v "{}" \;

	if [[ "$CARCH" == 'i686' ]]; then
	rm -r "${srcdir}/fieldtrip/realtime/bin/glnxa64"
	find "${srcdir}/fieldtrip" -name \*.mexa64\* -exec rm -v "{}" \;
	fi

	if [[ "$CARCH" == 'x86_64' ]]; then
	rm -r "${srcdir}/fieldtrip/realtime/bin/glnx86"
	find "${srcdir}/fieldtrip" -name \*.mexglx\* -exec rm -v "{}" \;
	fi

	mkdir -p "${pkgdir}/opt"
	cp -r "${srcdir}/fieldtrip" "${pkgdir}/opt/"
	rm -r "${pkgdir}/opt/fieldtrip/.git"

}
