# Maintainer: Bruno Adele <bruno.adele#jesuislibre.org>
pkgname=lxardoscope
pkgver=0.9
pkgrel=1
pkgdesc="Oscilloscope using Arduino Uno for data acquisition"
arch=('i686' 'x86_64')
url="http://lxardoscope.sourceforge.net/"
license=('GPL')
groups=()
depends=( libx11 )
[ "$CARCH" = "x86_64" ] && depends=( 'lib32-libx11' )
makedepends=() 
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://downloads.sourceforge.net/$pkgname/${pkgname}_${pkgver}.tar.gz)
noextract=()
sha256sums=('3e539bbe09ff0f9c9e1433d4fcb159b36afdfabf7913ef056ca835b2e99a2a4e')

build() {
	cd "$srcdir"

	tar -xf ${pkgname}_${pkgver}.tar
}

package() {
	cd "$srcdir/${pkgname}_${pkgver}"	

	install -D -m 755 lxardoscope  "${pkgdir}/usr/bin/lxardoscope"

	install -d $pkgdir/usr/share/doc/lxardoscope
	install -D -m 644 README $pkgdir/usr/share/doc/lxardoscope/README
	install -D -m 755 ATmega/lxardoscope/lxardoscope.pde $pkgdir/usr/share/doc/lxardoscope/lxardoscope.pde 
}
