# Contributor: Loui Chang <louipc dot ist at gmail company>
# Contributor: rxvt <artwithin@gmail.com>

pkgname=skippy-xd
pkgver=0.5.0
pkgrel=4
pkgdesc="A full-screen task-switcher for X11, similar to Apple's Expose."
url="http://thegraveyard.org/skippy.php"
license=('GPL')
depends=('libxrender' 'libxcomposite' 'libxdamage' 'libxfixes' 'libxft' 'xorg-server')
arch=('i686' 'x86_64')
source=("http://thegraveyard.org/files/$pkgname-$pkgver.tar.bz2" "README")
md5sums=('0e847845c4cb8c16f79bc4538ae288ad'
         'ff6017def2516f0dfee12bf122100dc9')
sha256sums=('52ff7476b3580a92c385167f1855583c2cf74ae1898a6a5e8446ce67c80bc139'
            '6f0ba086d06462855d1eae9acab35dd2ce98da18a179e58590488315156b0b8d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	[ $CARCH = 'x86_64' ] && sed -i 's|CARD32|CARD64|g' wm.*

	CFLAGS="$CFLAGS -DDEBUG"
	make X11PREFIX=/usr/lib
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make PREFIX=/usr DESTDIR=${pkgdir} install
	install -D -m 0644 skippy-xd.rc-default "${pkgdir}/usr/share/${pkgname}/skippy-xd.rc-default"
	install -m 0644 "${srcdir}/README" "${pkgdir}/usr/share/${pkgname}/README"
}
