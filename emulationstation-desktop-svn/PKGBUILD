# Maintainer: SSF <punx69 at gmx dot net>

pkgname=emulationstation-desktop-svn
pkgrel=1
pkgver=r1198.2.0.0rc1
pkgdesc="A graphical front-end for emulators with controller navigation. (desktop specific build, it also uses svn instead of git --> smaller download)"
arch=('i686' 'x86_64')
url="https://github.com/Aloshi/EmulationStation"
license=('MIT' 'CCPL:cc-by-nc-sa-2.0')
makedepends=('subversion' 'boost' 'eigen' 'glu' 'cmake' 'mesa' 'coreutils' 'p7zip' 'make' 'gawk' 'sed')
depends=('alsa-lib' 'sdl2' 'boost-libs' 'freeimage' 'curl' 'freetype2' 'expat' 'bzip2')
conflicts=('emulationstation-git' 'emulationstation-themes' 'emulationstation-git-unstable' 'emulationstation-git-unstable-rpi')
provides=("emulationstation=$pkgver" "emulationstation-themes=$(date '+%Y%m%d')")
###the usual checkout - stable
#_svntrunk=https://github.com/Aloshi/EmulationStation
### master/trunk - testing? ;)
_svntrunk=https://github.com/Aloshi/EmulationStation/trunk
###the unstable branch
#_svntrunk=https://github.com/Aloshi/EmulationStation/branches/unstable
_svnmod="$pkgname"
###this is non-free
_themezip=http://www.emulationstation.org/downloads/themes/simple_latest.zip


pkgver() {
	cd "$srcdir"/"$_svnmod"  >/dev/null 2>&1
	releaseversion=$(cat es-app/src/EmulationStation.h | grep "PROGRAM_VERSION_STRING" | awk '{print $3}' | sed -e 's#"##g' -e 's#-##g')
	ver=$(svn log $_svntrunk --config-dir "$srcdir" | awk 'NR==2' | awk '{print $1}')
	printf "$ver.$releaseversion"
}

_make() {
	read -p "Would you like to optimize your build (march=native)? [y/N] " reply
	case $(echo $reply | tr '[A-Z]' '[a-z]') in
		y|yes)
			export CFLAGS='-march=native -pipe'
			export CXXFLAGS="$CFLAGS";;
		*)
			msg "using default flags";;
	esac
	cmake -DCMAKE_BUILD_TYPE=Release ..
	read -p "Would you like to use parallel make (make -j$(expr $(nproc) \* 2 - 1) -l $(nproc))? [y/N] " reply
	case $(echo $reply | tr '[A-Z]' '[a-z]') in
		y|yes)
			make -j$(expr $(nproc) \* 2 - 1) -l $(nproc);;
		*)
			make;;
	esac
}

build() {
	cd "$srcdir"
	msg "Connecting to SVN server...."
	if [ -d "$_svnmod/.svn" ]; then
		(
		cd "$_svnmod"
		svn status --config-dir "$srcdir" --no-ignore | grep -E '(^\?)|(^\I)|(^\M)' | sed -e 's/^. *//' | sed -e 's/\(.*\)/"\1"/' | xargs rm -drf
		svn up . --config-dir "$srcdir"
		)
	else
		svn co "$_svntrunk" --config-dir "$srcdir" "$_svnmod"
	fi
	msg "SVN checkout done or server timeout"
		read -p "Would you like to view the SVN log? [y/N] " reply
	case $(echo $reply | tr '[A-Z]' '[a-z]') in
		y|yes)
			(
			svn log "$_svnmod" --config-dir "$srcdir" | less
			);;
		*)
			msg "skipped";;
	esac
	mkdir -p "$srcdir/$_svnmod/build"
	cd "$srcdir/$_svnmod/build"
	_make
#####themes
	msg "trying to get the simple theme"
	curl -L "$_themezip" >"$srcdir/$_svnmod/build/simple_latest.zip"
	7z x simple_latest.zip
}

package() {
	cd $_svnmod
	install -Dm755 "$srcdir/$_svnmod/emulationstation" "$pkgdir/usr/bin/emulationstation"
	install -Dm644 "$srcdir/$_svnmod/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$_svnmod/opensans_license.txt" "$pkgdir/usr/share/licenses/$pkgname/opensans.LICENSE"
	mkdir -p "$pkgdir/etc/emulationstation/themes"
	cp "$srcdir/$_svnmod/build/simple/readme.txt" "$pkgdir/usr/share/licenses/$pkgname/simpletheme.LICENSE"
	mv "$srcdir/$_svnmod/build/simple" "$pkgdir"/etc/emulationstation/themes
	chmod -R 0755 "$pkgdir"/etc/emulationstation/themes
###create a desktop file
	install -Dm644 "$srcdir/$_svnmod/data/resources/window_icon_256.png" "$pkgdir/usr/share/pixmaps/emulationstation.png"
	mkdir -p "$pkgdir/usr/share/applications"
cat <<EOF >> "$pkgdir/usr/share/applications/emulatorstation.desktop"
[Desktop Entry]
Name=EmulationStation
GenericName=Emulator front-end
Comment=A universal emulator front-end
Exec=emulationstation
Terminal=false
Type=Application
Icon=emulationstation
Categories=Application;Game;
StartupNotify=false
EOF
}
