# Contributor: Archie <Mymaud@gmail.com>

pkgname=frogmicroblog
pkgver=0.1.4
pkgrel=3
pkgdesc="twitter identi.ca client."
depends=('mono' 'notify-sharp-svn' 'webkit-sharp' 'libsexy')
arch=('i686' 'x86_64')
license=('GPL')
source=("http://froggymicroblog.googlecode.com/files/$pkgname-$pkgver.tar.gz" \
	"frogmicroblog.png" \
	"frogmicroblog.desktop")
	
url="http://code.google.com/p/froggymicroblog/"
md5sums=('8b7c9d2ca023936e0313645424957220'\
	'004a8fd2fadcfecc027223fd4465ab48' \
	'f311ae6da4f7e60440b314e7d27e7c9c')

build() {
	export MONO_SHARED_DIR="${startdir}/src/.wabi"

	install -d "${MONO_SHARED_DIR}"
	install -d $pkgdir/usr/share/{applications,pixmaps}
	
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install
	
	install -D -m644 $startdir/frogmicroblog.png $pkgdir/usr/share/pixmaps
	install -D -m644 $startdir/frogmicroblog.desktop $pkgdir/usr/share/applications
}

