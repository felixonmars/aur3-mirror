pkgname=genplaylist-git
pkgver=20110218
pkgrel=2
pkgdesc="Playlist Generator for MPD using Last.fm data"
arch=('i686' 'x86_64')
url="https://github.com/kornKoala/genPlaylist"
depends=('mpd' 'ruby' 'ruby-librmpd')
makedepends=('git')
license=('GPL')
source=()
md5sums=()

_gitroot="git://github.com/kornKoala/genPlaylist.git"
_gitname="genPlaylist"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server..."
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull --all
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
}

package() {
    install -D -m755 $srcdir/$_gitname/genplaylist.rb \
        $pkgdir/usr/bin/genplaylist
}

