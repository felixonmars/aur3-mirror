# maintainer: KittyKatt <kittykatt@kittykatt.us>
pkgname=mpdnotify
_pkgname=mpd-libnotify
pkgver=1.2.0
pkgrel=1
pkgdesc="libnotify daemon for MPD"
arch=('any')
url="http://git.silverirc.com/cgit.cgi/mpd-libnotify.git/"
license=('GPL')
conflicts=('mpdnotify-git')
depends=('bash' 'imagemagick' 'libnotify' 'mpd')
makedepends=('libnotify' 'imagemagick' 'mpd')
source=(http://git.silverirc.com/cgit.cgi/mpd-libnotify.git/snapshot/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('5d5088104a5f12b982e49f496f565308')

build() {
	cd "$srcdir/${_pkgname}-${pkgver}"

	# Create pkgdir folders
	install -d $pkgdir/usr/bin
	install -d $pkgdir/usr/share/mpd-libnotify

	# Install
	cp -r extras $pkgdir/usr/share/mpd-libnotify
	cp mpdnotify $pkgdir/usr/share/mpd-libnotify
	cp README.mkdn $pkgdir/usr/share/mpd-libnotify

	ln -s /usr/share/mpd-libnotify/mpdnotify $pkgdir/usr/bin/mpdnotify
}
