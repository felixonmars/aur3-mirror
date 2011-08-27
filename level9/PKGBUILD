# Contributor: Eric Forgeot < http://ifiction.free.fr >
# Contributor: thr >
pkgname=level9
pkgver=5.1
pkgrel=2
pkgdesc="An interpreter for games from the British text adventure company Level 9"
arch=(i686 x86_64)
url="http://www.ifarchive.org/if-archive/level9/interpreters/level9/"
license=('gpl')
depends=('gtk2')
makedepends=('gzip')
source=(http://mirror.ifarchive.org/if-archive/level9/interpreters/level9/Level9_${pkgver}_Source.zip)
md5sums=('7566e9b527a22164bf91c02b44a2bc81')


build() {
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/level9
	
	cd $srcdir/Gtk
	make || return 1
	
	cp gtklevel9 $pkgdir/usr/bin/
	cp README $pkgdir/usr/share/level9/
	cp BUGS $pkgdir/usr/share/level9/
	cp $srcdir/level9.txt $pkgdir/usr/share/level9/
	
	ln -s /usr/bin/gtklevel9 $pkgdir/usr/bin/level9 
	
	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/../$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	
	install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

	
}

#http://standards.freedesktop.org/menu-spec/latest/apa.html
