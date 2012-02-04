# Maintainer: x-demon
# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=husky-smapi-cvs
pkgver=20120129
pkgrel=2
pkgdesc="Husky message API for accessing *.MSG, Squish and Jam message base files"
arch=('i686' 'x86_64')
url="http://husky.sourceforge.net/smapi.html"
license=('GPL2')
depends=('husky-huskylib-cvs')
provides=('husky-smapi')
options=('!libtool')

_cvsroot=":pserver:anonymous@husky.cvs.sourceforge.net:/cvsroot/husky"
_cvsmod="smapi"

build() {
	cd "$srcdir"

	msg "Performing source checkout..."
	if [ -d "$_cvsmod/CVS" ]; then
		cd "$_cvsmod"
		cvs -z3 update -d
		cd ..
	else
		cvs -z3 -d "$_cvsroot" co -D "$pkgver" -f "$_cvsmod"
	fi
	msg "Source checkout finished."

	rm -rf "$_cvsmod-build"
	cp -r "$_cvsmod" "$_cvsmod-build"
	cd "$_cvsmod-build"

	sed -i '/^DYNLIBS=/ s/0/1/' huskymak.cfg
	cp huskymak.cfg "$srcdir"

	make
}

package() {
	cd "$srcdir/$_cvsmod-build"

	make DESTDIR="$pkgdir" install
	install -Dm644 cvsdate.h "$pkgdir/usr/include/smapi"
}
