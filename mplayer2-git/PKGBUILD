# Maintainer:  Matt Monaco <net 0x01b dgbaley27>
# Contributor: Matej Lach <matej.lach@gmail.com>
# Contributor: cantabile <cantabile dot desu at gmail dot com>
# Contributor: extcake < extcake@gmail.com >

pkgname=mplayer2-git
pkgver=v2.0.726.g6c87a98
pkgrel=2
pkgdesc="An advanced general-purpose video player."
url="http://www.mplayer2.org"
license=(GPL3)
arch=(x86_64 i686)
install="$pkgname.install"
source=(
	git://git.mplayer2.org/mplayer2-build.git
	git://repo.or.cz/mplayer.git
	git://repo.or.cz/libass.git
	git://repo.or.cz/FFMpeg-mirror/mplayer-patches.git
	"$pkgname.install"
	giflib-build-fix.patch
)
sha256sums=(
	SKIP SKIP SKIP SKIP
	547dd8fa8de0f4e688722c277a7848c180e96edf0fda4a48a3ec27e5ee675b8d
	bf6949e66b939e30b1d537ff3738d390d567b5b6a916fa57cc1ea121b2fb0963
)
backup=(
	etc/mplayer/codecs.conf
	etc/mplayer/input.conf
)
depends=(fribidi freetype2 fontconfig desktop-file-utils)
# The dependencies here are *required* to build by the default options. fribidi
# is needed for libass. freetype2 and fontconfig are needed for mplayer itself
# (yes, ./configure --help says they are autodetected, but it lies, they need to
# be explicitly disabled)
makedepends=(git yasm python python-docutils)
conflicts=(mplayer mplayer2)
provides=(mplayer mplayer2)
options=(!emptydirs)

pkgver()
{
	cd "$srcdir/mplayer"
	local ver=$(git describe --tags )
	echo ${ver//-/.}
}

prepare()
{
	cd "$srcdir/mplayer2-build"
	git submodule init
	git config submodule.mplayer.url "$srcdir/mplayer"
	git config submodule.libass.url  "$srcdir/libass"
	git config submodule.libav.url   "$srcdir/mplayer-patches"
}

build()
{
	cd "$srcdir/mplayer2-build"
	cat > mplayer_options <<-EOF
		--prefix=/usr
		--confdir=/etc/mplayer
		EOF
	./init
	patch -p0 -i "$srcdir"/giflib-build-fix.patch
	make
}

package()
{
	cd "$srcdir/mplayer2-build"

	make DESTDIR="$pkgdir" install

	install -m644 mplayer/etc/{codecs,input,example}.conf "$pkgdir/etc/mplayer"
	install -dm755 "$pkgdir/usr/share/mplayer"
	ln -s "../fonts/TTF/DejaVuSans.ttf" "$pkgdir/usr/share/mplayer/subfont.ttf"
	sed -i 's/gmplayer/mplayer/g' "mplayer/etc/mplayer.desktop"
	install -Dm644 "mplayer/etc/mplayer.desktop" "$pkgdir/usr/share/applications/mplayer.desktop"
	install -Dm644 "mplayer/etc/mplayer.xpm" "$pkgdir/usr/share/pixmaps/mplayer.xpm"
}

# vim: set noet :
