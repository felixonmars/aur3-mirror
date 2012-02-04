# Maintainer: Malte Wessel <muunleit AT lavabit DOT com>

pkgname=starfilledsky
pkgver=17
pkgrel=1
pkgdesc="'Inside a Star-filled Sky' is an infinite, recursive, tactical shooter for one player by Jason Rohrer. (Commercial)"
arch=('any')
url="http://insideastarfilledsky.net"
license=("none:opensource")
depends=('sdl')

# If you get another file from Blendo Games, please change it here
_gamepkg="StarFilledSky_v${pkgver}_UnixSource.tar.gz"
_gamemd5="eff87da5cc30edaf5abfe801be0180c2"


build() {
	# Check if game-archive is in build directory, than validate
	cd $startdir
	if [[ ! -f $_gamepkg ]]; then
		msg "!! 'Inside a Star-filled Sky' is a commercial game."
		msg "!! You need a full copy of this game in order to install it."
		msg "!! Please copy $_gamepkg to $startdir " && return 1
	else
		if [[ "$(md5sum $_gamepkg | awk '{print $1}')" == "$_gamemd5" ]]; then
			msg "Check: $_gamepkg is the correct."
		else
			msg "!! Check: $_gamepkg didn't match md5sum. Exiting!" && return 1
		fi
	fi

	# Extract game-archive
	msg "Extracting archive..."
	tar xaf $startdir/$_gamepkg -C $srcdir 

	cd $srcdir/${_gamepkg//.tar.gz/}

	# Build game - taken from Jasons 'runToBuild'
	cd game10
	msg "Configuring $pkgname ..."
	../minorGems/game/platforms/SDL/configure 1 || exit 1

	cd gameSource
	msg "Building $pkgname ..."
	make || exit 1

	# Create startscript
	cat > $srcdir/$pkgname <<- EOF
	#!/bin/sh

	cd /opt/$pkgname/
	exec ./StarFilledSky
	EOF

	# Create desktop-file
	cat > $srcdir/$pkgname.desktop <<- EOF
  [Desktop Entry]
  Name=Inside a Star-flled Sky
  GenericName=StarFilledSky
  Comment=An infinite, recursive, tactical shooter for one player by Jason Rohrer
  Exec=starfilledsky
  Terminal=false
  Type=Application
  Categories=Game;
	EOF

	# Create log.txt , the user needs the permissions to change, later
	touch $srcdir/log.txt

}

package() {
	# Create pkgdir folders
	install -d $pkgdir/usr/bin
	install -d $pkgdir/usr/share/doc/$pkgname
	install -d $pkgdir/usr/share/applications
	install -m 775 -g games -d $pkgdir/opt/$pkgname
	install -m 775 -g games -d $pkgdir/opt/$pkgname/playbackGame
	install -m 775 -g games -d $pkgdir/opt/$pkgname/recordedGames
	install -m 775 -g games -d $pkgdir/opt/$pkgname/settings

	# Copy log.txt
	install -m 664 -g games $srcdir/log.txt $pkgdir/opt/$pkgname

	# Copy startscript and desktop-file
	install -m 755 $srcdir/$pkgname         $pkgdir/usr/bin/
	install -m 755 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/

	# Copy game
	cp -a $srcdir/${_gamepkg//.tar.gz/}/game10/gameSource/StarFilledSky	$pkgdir/opt/$pkgname/
	cp -a $srcdir/${_gamepkg//.tar.gz/}/game10/gameSource/graphics      $pkgdir/opt/$pkgname/
	cp -a $srcdir/${_gamepkg//.tar.gz/}/game10/gameSource/settings/*    $pkgdir/opt/$pkgname/settings/
	cp -a $srcdir/${_gamepkg//.tar.gz/}/game10/gameSource/languages     $pkgdir/opt/$pkgname/
	cp -a $srcdir/${_gamepkg//.tar.gz/}/game10/gameSource/language.txt  $pkgdir/opt/$pkgname/
	cp -a $srcdir/${_gamepkg//.tar.gz/}/game10/documentation/*          $pkgdir/usr/share/doc/$pkgname

}

# vim:set ts=2 sw=2 et:
