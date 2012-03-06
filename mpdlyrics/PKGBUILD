# Maintainer: Brett Bohnenkamper (aka kittykatt) kittykatt@kittykatt.us
pkgname=mpdlyrics
pkgver=1.1.0
pkgrel=3
pkgdesc="MPD Lyrics Fetcher"
arch=('any')
url=('http://www.kittykatt.us')
license=('GPL')
depends=('bash' 'mpd')
makedepends=('git')

_gitroot="git://git.silverirc.com/mpdlyrics.git"
_gitname="mpdlyrics"

build() {
	# Git
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	install -Dm755 ${srcdir}/${_gitname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}