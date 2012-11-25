# Maintainer:  Matt Monaco <net 0x01b dgbaley27>
# Contributor: Matej Lach <matej.lach@gmail.com>
# Contributor: cantabile <cantabile dot desu at gmail dot com>
# Contributor: extcake < extcake@gmail.com >

__gitroot="git://github.com/giselher/mplayer2-wayland.git"
__gitname="mplayer2-wayland.git"
__gitcommit="master"

pkgname=mplayer2-wayland-git
pkgver=20121115
pkgrel=1
pkgdesc="An advanced general-purpose video player. With patches for wayland support (unset DISPLAY, -vo gl)."
url="https://github.com/giselher/mplayer2-wayland"
license=(GPL3)
arch=('x86_64' 'i686')
install="$pkgname.install"
source=(
	"$pkgname.install"
)
sha256sums=(
	"547dd8fa8de0f4e688722c277a7848c180e96edf0fda4a48a3ec27e5ee675b8d"
)
backup=(
	"etc/mplayer/codecs.conf"
	"etc/mplayer/input.conf"
)
depends=("fribidi" "freetype2" "fontconfig" "desktop-file-utils" "ffmpeg" "wayland")
# The dependencies here are *required* to build by the default options. fribidi
# is needed for libass. freetype2 and fontconfig are needed for mplayer itself
# (yes, ./configure --help says they are autodetected, but it lies, they need to
# be explicitly disabled)
makedepends=("git" "yasm" "python")
conflicts=("mplayer" "mplayer2")
provides=("mplayer" "mplayer2")
options=("!emptydirs")

build()
{
	_git_setup
	cd "$srcdir/$pkgname-$pkgver"
	
	./configure --prefix=/usr --confdir=/etc/mplayer --language=all --language-man=en
	sed -i s/rst2man/rst2man2/g config.mak
	make
}

package()
{
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install install-mplayer-man-en

	install -m644 etc/{codecs,input,example}.conf "$pkgdir/etc/mplayer"
	
	install -dm755 "$pkgdir/usr/share/mplayer"
	
	ln -s "../fonts/TTF/DejaVuSans.ttf" "$pkgdir/usr/share/mplayer/subfont.ttf"
	
	sed -i 's/gmplayer/mplayer/g' "etc/mplayer.desktop"
	install -Dm644 "etc/mplayer.desktop" "$pkgdir/usr/share/applications/mplayer.desktop"

	install -Dm644 "etc/mplayer.xpm" "$pkgdir/usr/share/pixmaps/mplayer.xpm"
}

_git_setup() {

	cd "$SRCDEST"
	
	if [[ ! -d "$__gitname" ]]; then
		msg2 "Cloning git repository"
		git clone --mirror "$__gitroot" "$__gitname"
	else
		msg2 "Updating git repository"
		cd "$__gitname"
		git fetch
	fi

	cd "$srcdir"
	if [[ -d "$pkgname-$pkgver" ]]; then
		msg2 "Removing previous build tree"
		rm -fr "$pkgname-$pkgver"
	fi

	msg2 "Creating fresh build tree"
	git clone --depth=1 -b "$__gitcommit" "file://$SRCDEST/$__gitname" "$pkgname-$pkgver"
}
