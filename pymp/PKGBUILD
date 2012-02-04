pkgname=pymp
pkgver=1.1
pkgrel=3
url="http://jdolan.dyndns.org/trac/wiki/Pymp"
pkgdesc="PyGTK frontend for MPlayer"
depends=('mplayer' 'pygtk')
source=(http://jdolan.dyndns.org/files/${pkgname}-${pkgver}.tar.bz2 pymp.desktop)
arch=('i686' 'x86_64')
license=('GPL')

md5sums=('da77dadfeb9504c94b8ff80645df6724'
         'eb63f882bb403320989288c25bfe05da')

build() {
	cd $srcdir/$pkgname-$pkgver

	# fix python -> python2 transition
	sed -i -e 's|`which python`|`which python2`|' \
		$(find . \( -name 'pymp' -o -name 'Makefile' \) )

	make || return 1
	make DESTDIR=$pkgdir PREFIX=/usr install
	install -D -m644 $srcdir/$pkgname.desktop \
        $pkgdir/usr/share/applications/$pkgname.desktop || return 1
}
