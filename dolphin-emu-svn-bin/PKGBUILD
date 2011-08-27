# Maintainer:  Devin Cofer <ranguvar{AT]archlinux{DOT]us>
# Contributor: Hans-Kristian Arntzen <maister@archlinux.us>

pkgname=dolphin-emu-svn-bin
pkgver=4467
pkgrel=1
pkgdesc="GameCube and Wii emulator (Unofficial dev tree build)"
arch=('i686' 'x86_64')
url="http://www.dolphin-emu.com/"
license=('GPL2')

depends=('bluez' 'libao' 'portaudio' 'wxgtk>=2.8' 'wxgtk<2.9' 'wiiuse' 'nvidia-cg-toolkit' 'glew' 'sdl' 'libxxf86vm')
provides=('dolphin-emu' "dolphin-emu-svn=$pkgver")
conflicts=('dolphin-emu' 'dolphin-emu-svn')

source=("http://www.cs.huji.ac.il/~elylevy/dolphin/$CARCH/dolphin-$pkgver-release.tar.bz2"
        'dolphin-emu.desktop')
sha256sums=('2c49b6211cbdced639cdd92f31d31aa7a0917ecfcdf6b2154d24c25bf521603c'
            '6378e5925eb891071c7396656dd0ee1e9f4f26553c964fdaec87154b5b37a193')
if [ "$CARCH" == "i686" ]; then
	sha256sums[0]='25659a821f7e010e9a695f88d6da6d9f591f01016768846b661745ec99cab926'
fi

install="$pkgname.install"

build() {
	# Remove SVN leftovers
	for svndir in $(find . -name '.svn' -type d); do rm -r $svndir; done

	mkdir -p "$pkgdir/opt/dolphin-emu"
	cp -r "Binary/Linux-$CARCH/"* "$pkgdir/opt/dolphin-emu/" || return 1

	mkdir -p "$pkgdir/usr/bin"
	echo -e "#! /bin/sh\ncd /opt/dolphin-emu ; ./Dolphin" > \
	        "$pkgdir/usr/bin/dolphin-emu" || return 1
	chmod +x "$pkgdir/usr/bin/dolphin-emu" || return 1
	ln -s "$pkgdir/opt/dolphin-emu/dsptool" "$pkgdir/usr/bin/dsptool" || return 1
	install -Dm644 dolphin-emu.desktop \
	               "$pkgdir/usr/share/applications/dolphin-emu.desktop" || return 1
}
