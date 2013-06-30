# Maintainer: Leyorus <leyorus@gmail.com>
# Contributor: Leyorus <leyorus@gmail.com>
pkgname=mkvextract-gtk-git
pkgver=20130202
pkgrel=2
pkgdesc="Simple Linux GUI to extract tracks from matroska (mkv) files"
conflicts=('mkvextract-gtk')
arch=(any)
url="https://bitbucket.org/Leyorus/mkvextract-gtk/"
license=('GPL2')
depends=('mkvtoolnix-cli')
makedepends=('git' 'gcc' 'cmake' 'boost')
_gitroot="https://bitbucket.org/Leyorus/mkvextract-gtk.git"
_gitname="mkvextract-gtk"

build() {
	cd "$srcdir"
	if [[ -d $_gitname ]] ; then
		cd $_gitname && git pull origin && cd .. 
	else
		git clone $_gitroot
	fi
	cd $_gitname

	cmake . && make
	
	mkdir -p $pkgdir/usr/bin/
	cp mkvextract-gtk $pkgdir/usr/bin/
	chmod +x $pkgdir/usr/bin
}
