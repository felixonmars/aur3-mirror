# Maintainer: Isaac Dupree <id@isaac.cedarswampstudios.org>
# Contributor: henning mueller <henning@orgizm.net>
pkgname=jason-rohrer-games
#Not sure if jason-rohrer-games should be one package rather
#than one for each game.
#
#Each of the games has its own version-release number.
#
#So I have no idea what this pkgver means -- when I inherited it
#it was version 3.575 release 2.  I bumped the pkgver when the
#packaging-update included updating to newer upstream tarballs.
#  -Isaac
pkgver=3.576
pkgrel=1
#List the games, arbitrarily, in the order in which they were released.
pkgdesc="Art games of Jason Rohrer: Transcend, Cultivation, Passage, Gravitation, Between, and Primrose."
#^^ Sleep Is Death is non-free, as of August 2010, and thus cannot be included.
arch=(i686 x86_64)
url="http://hcsoftware.sourceforge.net/jason-rohrer/"
license=(GPL custom)
#'sh' dependency is only for the wrapper-scripts created in build()
depends=(sdl freeglut libpng libxmu sh)
#only bother to conflict with the
#individually-packaged-versions-of-these-games
#that exist on AUR, 3 Sept. 2010
conflicts=(cultivation primrose)
install=$pkgname.install
source=(
	http://downloads.sourceforge.net/transcend/Transcend_0.3_UnixSource.tar.gz
	http://downloads.sourceforge.net/cultivation/Cultivation_9_UnixSource.tar.gz
	http://downloads.sourceforge.net/hcsoftware/Passage_v4_UnixSource.tar.gz
	http://downloads.sourceforge.net/hcsoftware/Gravitation_v3_UnixSource.tar.gz
	http://downloads.sourceforge.net/hcsoftware/Between_v6_UnixSource.tar.gz
	http://downloads.sourceforge.net/primrose/Primrose_v6_UnixSource.tar.gz
)
md5sums=(
	0d96a66037a738c0546c47916a281cd6
	49245426f02f526c0509117b82b6aa8f
	1073316014082689990ed2f3790b0865
	824fa45502ea3c63d3113bac0876bbd9
	1fd4db18689a0970e53a2be12f83ae5b
	3bef20e73e060482ef6602b890751abb
)

#These games have nonstandard build process and no installation
#process built in, so we have to do a bunch of work for them.
#
#They work properly except Primrose fails to save the game-state between runs
#(because it's trying to save state to a root-owned directory),
#
#and they're packaged according to standards except that settings
#are in /usr/share rather than /etc (below describes the difficulties).
_build_a_game() {
	_name=$1; shift
	_exe=$1; shift
	#Should Arch really patronizingly be making the game lowercase?
	#When we respect the capitalization of Eterm?
	_lname=$(echo $_name | tr "[:upper:]" "[:lower:]")
	
	#build:
	cd $srcdir/$_name*
	echo 1 | ./runToBuild

	#install:
	#(The games do not provide any Makefile install target
	# or other installation script; they're designed only
	# to be run in-place.)
	#game-data:
	_share_dir=usr/share/$pkgname/$_lname
	#(putting 'settings' in /usr/share (and not /etc),
	#as this does, isn't correct...Debian takes the
	#more tedious approach of patching
	#the C code to make correctness possible.
	#I've asked the author about it too -Isaac, 3 Sept. 2010)
	mkdir -p $pkgdir/$_share_dir
	cp -r "$@" $pkgdir/$_share_dir
	#executable:
	#which needs to be run with cwd = share_dir,
	#thus the wrapper-script
	_exe_path=usr/lib/$pkgname/$_lname
	_script_path=usr/bin/$_lname
	install -D -m755 $_exe $pkgdir/$_exe_path
	mkdir -p $pkgdir/usr/bin
        cat > $pkgdir/$_script_path <<-EOF
		#!/bin/sh
		cd /$_share_dir
		exec /$_exe_path
	EOF
	chmod 755 $pkgdir/$_script_path
}

build() {
	#build and install the games
	_build_a_game Transcend TranscendApp {how_to_play.txt,levels}
	_build_a_game Cultivation Cultivation {features.txt,font.tga,languages,language.txt}
	_build_a_game Passage Passage {graphics,music,settings,Readme.txt}
	_build_a_game Gravitation Gravitation {graphics,music,settings,Readme.txt}
	_build_a_game Between Between {graphics,music,settings,Readme.txt,languages,language.txt}
	_build_a_game Primrose Primrose {graphics,settings,Readme.txt}

	#provide the requisite licensing information
	cd $pkgdir
	mkdir -p usr/share/licenses/$pkgname
	_lf=$pkgdir/usr/share/licenses/$pkgname/LICENSES
	echo "Cultivation, Passage, Gravitation, Between, and Primrose are public domain." > $_lf
	echo "Transcend is released under the terms of the GPL." >> $_lf
}
