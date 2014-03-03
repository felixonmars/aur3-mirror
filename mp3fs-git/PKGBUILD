# Author : Draje <draje@nullsum.net>

pkgname=mp3fs-git
pkgver=20140301
pkgrel=1
pkgdesc="A read-only FUSE filesystem which transcodes audio formats (currently FLAC) to MP3 on the fly when opened and read."
arch=('i686' 'x86_64')
url="http://khenriks.github.com/mp3fs/"
license=('GPL')
depends=('fuse' 'flac' 'lame' 'libid3tag')
makedepends=('git' 'asciidoc')
conflicts=('mp3fs')

_gitrepo="git://github.com/khenriks/mp3fs.git"
_gitname="mp3fs"

build() {
	cd "$srcdir"

	rm -rf "$_gitname"
	git clone "$_gitrepo" 
	cd "$_gitname"

	./autogen.sh
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd "$srcdir/"$_gitname"/"
	make PREFIX=/usr sysconfdir=/etc localstatedir=/var DESTDIR="$pkgdir" install
}
