# Contributor: Heikki Mehtänen <heikki at mehtanen dot fi> 

pkgname=wuu
pkgver=1.9.673
pkgrel=1
pkgdesc="WoW UI Updater"
arch=('i686' 'x86_64')
url="http://wuu.vagabonds.info/"
license=('custom:zlib')
depends=('wxgtk' 'wxpython')
source=("wuu_linux.patch" "WUU" "LICENSE" "http://wuu.vagabonds.info/files/WUU-$pkgver-src.zip")
md5sums=('2649c9af0267dcb253933c5b9b9258eb'
         '020643f77df112f438a0f05c1a34ef9a'
         '306ac6425547e32eb8dc261b70bd0a68'
         'c2f3d12a411c50985e719e2acde746c1')

build() {
	# making mandatory directories
	mkdir -p $pkgdir/usr/share/{wuu/lang,licenses/wuu}
	mkdir -p $pkgdir/usr/bin

	cd $srcdir
	patch -p0 < wuu_linux.patch

	# copy files
	install -m755 $srcdir/WUU $pkgdir/usr/bin/
	install -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/wuu/
	install -m644 $srcdir/*[^lang] $pkgdir/usr/share/wuu/
	install -m644 $srcdir/lang/* $pkgdir/usr/share/wuu/lang/

	# remove futile paraphanelia
	for i in 0 1 2; do
		rm $pkgdir/usr/share/wuu/${source[$i]}
	done
	rm $pkgdir/usr/share/wuu/WUU-$pkgver-src.zip
}	
