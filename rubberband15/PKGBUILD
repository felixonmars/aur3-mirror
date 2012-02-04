# Contributor: Loren Copeland

pkgname=rubberband15
pkgver=1.5.0
pkgrel=2
pkgdesc="Older version of the rubberband time-stretching and pitch-shifting audio library and utility, provided because it works."
arch=('i686' 'x86_64')
url="http://www.breakfastquay.com/rubberband/"
license=('GPL')
depends=('libsamplerate' 'fftw' 'vamp-plugin-sdk')
makedepends=('ladspa' 'cpio' 'rpm-org')
provides=('rubberband')
conflicts=('rubberband')
if [ $CARCH == x86_64 ] ; then
	source=("ftp://ftp.muug.mb.ca/mirror/fedora/linux/updates/13/x86_64/rubberband-1.5.0-1.fc13.x86_64.rpm")
	md5sums=('5d76dcb33dd17aeb895820ff50f37e72')
else
	source=("ftp://ftp.muug.mb.ca/mirror/fedora/linux/updates/13/i386/rubberband-1.5.0-1.fc13.i686.rpm")
	md5sums=('60591e636ab347bae219a67fc09fdf9f')
fi
noextract=('rubberband-1.5.0-1.fc13.$CARCH.rpm')

build() {
	rm -r "$srcdir"/usr
	cd "$srcdir"
	rpm2cpio rubberband-1.5.0-1.fc13.$CARCH.rpm > rubberband-1.5.0.cpio
	cpio --no-absolute-filenames -diI rubberband-1.5.0.cpio

	if [ $CARCH = x86_64 ] ; then
		mv usr/lib64 usr/lib
	fi
}

package() {
	cd "$srcdir"
	cp -r usr "$pkgdir"
}

# vim:set ts=2 sw=2 et:
