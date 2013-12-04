# Maintainer: wenLiangcan <boxeed@gmail.com>

pkgname=hyro
pkgver=0.0.3
pkgrel=1
pkgdesc="A real-time HTML5 editor."
arch=('i686' 'x86_64')
url="http://jawerty.github.io/Hyro/"
license=('MIT')
source=('http://jawerty.github.io/Hyro/apps/Hyro-0.0.3_i386.deb'
		'hyro.desktop')
md5sums=('dda45f182a4c867410f5d7ca126fa9d4'
		 '9d2abcc9dbd387202c1da365e3ccf8a2')
options=('!strip')

if [ "$CARCH" = "i686" ]; then
		depends=('nss' 'gconf' 'libudev.so.0' 'gtk2' 'gdk-pixbuf2' 'freetype2' 'alsa-lib' 'nvidia-utils')
elif [ "$CARCH" = "x86_64" ]; then
		depends=('lib32-nss' 'lib32-gconf' 'lib32-libudev.so.0' 'lib32-gtk2' 'lib32-gdk-pixbuf2' 'lib32-freetype2' 'lib32-alsa-lib' 'lib32-nvidia-utils')
fi

build() {
		cd "$srcdir"
		tar -zxf data.tar.gz
}

package() {
		cd "$srcdir"
	    install -Dm644 "$srcdir/usr/share/icons/hyro_logo.png" "$pkgdir/usr/share/pixmaps/hyro_logo.png"
		rm -r "$srcdir/usr/share/icons"
		rm -r "$srcdir/usr/share/applications"
		cp -r "$srcdir/usr" "$pkgdir"
		install -Dm644 hyro.desktop "$pkgdir/usr/share/applications/hyro.desktop"
}
