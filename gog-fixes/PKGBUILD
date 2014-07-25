# Mantainer: Kozec (kozec2 <at> kozec <dot> com)

# Current fixes:
#	- Cannot open shared library /usr/lib/i386-linux-gnu/alsa-lib/libasound_module_pcm_pulse.so -> no sound in wine using games

pkgname=gog-fixes
pkgver=0.1
pkgrel=1
pkgdesc="Fixes no sound problem in wine using GOG games"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://aur.archlinux.org/packages/gog-fixes/"
source=('http://seblu.net/a/arm/2014/02/14/extra/os/i686/libpulse-4.0-6-i686.pkg.tar.xz')
md5sums=('10a081e715858ef81116feb8102c3cbb')
[ $CARCH == "i686" ] && depends=('alsa-plugins')
[ $CARCH == "x86_64" ] && depends=('lib32-alsa-plugins')

build() {
	true
}

package() {
	if [ $CARCH == "i686" ] ; then
		mkdir -p "$pkgdir/usr/lib/i386-linux-gnu"
		ln -s "/usr/lib/alsa-lib" "$pkgdir/usr/lib/i386-linux-gnu/alsa-lib"
		install -m 755 "$srcdir/usr/lib/pulseaudio/libpulsecommon-4.0.so" "$pkgdir/usr/lib/"
	else # x86_64 (hopefully)
		mkdir -p "$pkgdir/usr/lib/i386-linux-gnu"
		mkdir -p "$pkgdir/usr/lib32"
		ln -s "/usr/lib32/alsa-lib" "$pkgdir/usr/lib/i386-linux-gnu/alsa-lib"
		install -m 755 "$srcdir/usr/lib/pulseaudio/libpulsecommon-4.0.so" "$pkgdir/usr/lib32/"
	fi

}


