# Contributor: Sander Jansen <sander@knology.net>

pkgname=goggles
pkgver=0.9.1
pkgrel=2
pkgdesc="Frontend for Ogle DVD Player"
arch=('i686' 'x86_64')
depends=('fox>=1.6.0' 'ogle' )
license=('GPL')
source=(http://gogglesmm.googlecode.com/files/goggles-0.9.1.tar.bz2)
url="http://gogglesmm.googlecode.com"
md5sums=('f907442fd382c6331d1181e257c8b882')

build() {
	cd $startdir/src/$pkgname-$pkgver

	# Compile
	./gb  --use-config=build/config.generic

	# gb does not return valid error code
	if [ ! -f src/goggles ] ; then
		return 1
	fi

	# make sure destination exists
	mkdir -p $startdir/pkg/usr/{bin,share/goggles}

	# Install
	./gb install --prefix=$startdir/pkg/usr

	# Now the goggles script will point to /var/abs....etc
	# We need to correct this:
  sed -i "s|DVDP_UI=${startdir}/pkg/usr/bin/ogle_gui_goggles|DVDP_UI=/usr/bin/ogle_gui_goggles|" $startdir/pkg/usr/bin/goggles
}
