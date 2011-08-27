# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=gmpc-exiftool-git
pkgver=20100902
pkgrel=1
pkgdesc="Exif plugin for gmpc."
arch=('i686')
url="http://gmpc.wikia.com/"
license=('GPL')
groups=()
depends=(perl perl-exiftool gmpc)
makedepends=(git)
#source=($pkgname-$pkgver.tar.gz)
#noextract=()
#md5sums=() #generate with 'makepkg -g'

_gitroot="http://git.musicpd.org/cgit/qball/gmpc-exiftool.git/"
_gitname="gmpc-exiftool"

build() {
	cd $startdir/src
	msg "Connecting to $_gitroot server..."

	if [ -d $startdir/src/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
	cd $startdir/src/$_gitname-build

	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
}


# vim:set ts=2 sw=2 et:
