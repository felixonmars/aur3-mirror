# Contributor: KillaB <xGenoBlast@gmail.com>
# Contributor: wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: Nick <nick@screamingfist.org>
# Maintainer: Jupotter <jupotter.g@gmail.com>

pkgname=doomrl-ogg
pkgver=0.9.9.6
pkgrel=3
pkgdesc="A roguelike game based on the FPS Doom. OGG sound version."
arch=("i686" "x86_64")
url="http://doom.chaosforge.org/"
license=("custom")
depends=("sdl_mixer"
	"zlib"
	"lua"
	"timidity-eawpatches"
	"sdl_image")
makedepends=("sox")
conflicts=("doomrl-lq doomrl")
provides=("doomrl=0.9.9.6")
source=("http://doom.chaosforge.org/file_download/24/doomrl-linux-i686-0996.tar.gz"
	"doomrl" "LICENSE")
md5sums=('91b4aba471b6138ff2c7d32739350458'
	 '825cac701303cd5c61ec209e461219de'
	 'eaa0c779f98be421bf34cd0c5800642a')

[ "$CARCH" == "x86_64" ] &&
	source=("http://doom.chaosforge.org/file_download/25/doomrl-linux-x64-0996.tar.gz"
		"doomrl" "LICENSE")
[ "$CARCH" == "x86_64" ] &&
		md5sums=('9d3aa84421c6dc900c8a8e7c2619eee2'
			 '825cac701303cd5c61ec209e461219de'
			 'eaa0c779f98be421bf34cd0c5800642a')

_SIMONSITE="http://dl.dropbox.com/u/23785083/Doom_the_Roguelike_The_Album/OGG/"

_SIMONV="doom_the_roguelike.ogg final_showdown.ogg hells_weapons.ogg
of_skull_and_bone.ogg something_wicked.ogg the_brick_song.ogg
too_hot_down_here.ogg unholy_cathedral.ogg"

build() {
	cd "$srcdir/doomrl-linux-${CARCH/x86_64/x64}-${pkgver//./}"

	cp musichq.lua musicogg.lua
	MP3S=$(grep "= \"" musicogg.lua | sed -e 's/.*= \"mp3\///' -e 's/\",.*//' | awk '!x[$0]++')

	CONVERTS=$(echo "$MP3S" | awk "!/$(echo $_SIMONV | sed -e 's/ /|/g' -e 's/ogg/mp3/g')/")

	mkdir ogg
	for ANMP3 in $CONVERTS
	do
		echo "Converting: $ANMP3"
		OGGNAME=$(echo $ANMP3 | sed 's/mp3/ogg/g')
		sox "mp3/$ANMP3" -t vorbis "ogg/$OGGNAME" --show-progress
	done

	for ANOGG in $_SIMONV
	do
		QUICKFIX=$(echo "$ANOGG" | sed 's/doom_the_roguelike.ogg/doom_the_roguelike_theme.ogg/')
		echo "Downloading: $QUICKFIX"
		wget "$_SIMONSITE$QUICKFIX" -O ogg/$ANOGG
	done

	sed -i 's/mp3/ogg/g' musicogg.lua
	sed -i 's/dofile \"music.*lua\"/dofile \"musicogg.lua\"/' config.lua
	rm mp3/*
}


package() {
	cd "$srcdir/doomrl-linux-${CARCH/x86_64/x64}-${pkgver//./}"

	# Copy program and required files
	mkdir -p "$pkgdir/usr/share/doomrl"
	cp -a * "$pkgdir/usr/share/doomrl"

	# Copy script used to run program
	install -D -m755 "$srcdir/doomrl" "$pkgdir/usr/bin/doomrl"

	# Comy the license file
	install -D -m644 "$srcdir/LICENSE" \
	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# This is needed to save games and scores
	chmod 4755 "$pkgdir/usr/share/doomrl/doomrl"
}

