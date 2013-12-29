# Maintainer: Isaac Lleida, isaky <isaky.player@gmail.com>

pkgname=s4a
pkgver=1.5
pkgrel=5
pkgdesc="A customized version of Scratch prepared to interact with Arduino boards"
arch=('i686' 'x86_64')
url="http://www.s4a.cat/downloads"
license=('GPL2')
depends=('glibc' 'cairo' 'glib2' 'pango' 'v4l-utils' 'pulseaudio')
source=("${url}/S4A15.deb"
    	's4a.install'
	'README')
install=${pkgname}.install

package() {
	cd "$srcdir/"

	ar vx ./S4A15.deb
	tar -zxf ./data.tar.gz

	mv ./usr/lib/s4a/ ./usr/share/
	rmdir ./usr/lib/
	sed -i 's/lib/share/g' ./usr/bin/s4a
	sed -i 's/pulse/alsa/g' ./usr/bin/s4a

	cp -r ./usr "$pkgdir/"

	cp $startdir/README $pkgdir/usr/share/s4a/
}

md5sums=('3db96b683afcaf4ebc1afd37dc4e8197'
	 '39a4c7df31a7999664b131e6f7ca20d6'
	 '9fa6eda0c161daf7bdcc9abecf90b470')
