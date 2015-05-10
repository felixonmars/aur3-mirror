pkgname=d2x-xl-data
pkgver=1.17.95
pkgrel=3
pkgdesc="Required D2X-XL data, extras, and Descent 1 and 2 retail data."
arch=(any)
url="http://www.descent2.de"
license=("custom" "Public Domain")
depends=(d2x-xl)
makedepends=(dos2unix innoextract p7zip)
source=("http://www.descent2.de/files/d2x-xl-data-$pkgver.7z"
"http://www.descent2.de/files/movies/extra-movies.7z"
"http://www.descent2.de/files/gamedata/extra-hog.7z"
"vertigo_fixed.zip::http://www.planetdescent.net/index.php?PHPSESSID=siea2dvnnauba6vg04o5rl09s2&action=tpmod;dl=get51")
sha1sums=('1863e8ccd830cc0bea04704ebc11b81fc1c7bbb9'
          '2db5d6da8ab895a755ecdf1f7fc0dc2fc86b8397'
          'ef67c771d77661a3c47d8e3292625d1cc50b8359'
          '57e48cd004b8d45166ea1cf5d0e9d373e6cb0a09')

prepare() {
	_gog1_md5="c3fe34d48407201d6da65ae85b8e2e6b"
	_gog1_exe="setup_descent_2.1.0.8.exe"
	_gog2_md5="a2509588c7ca74b31689aeab19b16173"
	_gog2_exe="setup_descent2_2.1.0.10.exe"
	if [[ ! -f ../$_gog1_exe ]]; then
		error "You must have $_gog1_exe present (.exe in main dir)."
		error "Download the game from your GOG shelf and try again."
		return 1
	fi
	if [[ ! -f ../$_gog2_exe ]]; then
		error "You must have $_gog2_exe present (.exe in main dir)."
		error "Download the game from your GOG shelf and try again."
		return 1
	fi
	echo "GOG installers detected; checking md5sums ..."
	if ! echo "$_gog1_md5 ../$_gog1_exe" | md5sum -c --status; then
		error "Invalid md5sum; verify your download and try again."
		return 1
	else
		ln -s ../$_gog1_exe .
		innoextract $_gog1_exe
	fi
	if ! echo "$_gog2_md5 ../$_gog2_exe" | md5sum -c --status; then
		error "Invalid md5sum; verify your download and try again."
		return 1
	else
		ln -s ../$_gog2_exe .
		innoextract $_gog2_exe
	fi
	find . -type f -exec dos2unix {} \;
}

package() {
	folders="data models movies sounds textures"
	mkdir -p "$pkgdir/opt/d2x-xl/textures"
	for f in $folders; do
		cp -r $f "$pkgdir/opt/d2x-xl/"
		chmod 755 "$pkgdir/opt/d2x-xl/$f"
	done
	
	install -Dm644 config/d2x-default.ini "$pkgdir/etc/skel/d2x-default.ini"
	install -m644 d2x-h.mvl "$pkgdir/opt/d2x-xl/movies/d2x-h.mvl"
	install -m644 d2x-l.mvl "$pkgdir/opt/d2x-xl/movies/"
	install -Dm644 d2x.hog "$pkgdir/opt/d2x-xl/missions/d2x.hog"
	install -m644 d2x.mn2 "$pkgdir/opt/d2x-xl/missions/"
	install -m644 hoard.ham "$pkgdir/opt/d2x-xl/data/"
	
	cd app
	install -Dm644 __support/save/DESCENT.CFG "$pkgdir/opt/d2x-xl/config/descent.cfg"
	install -m644 ALIEN1.PIG "$pkgdir/opt/d2x-xl/data/alien1.pig"
	install -m644 ALIEN2.PIG "$pkgdir/opt/d2x-xl/data/alien2.pig"
	install -m644 DESCENT.HOG "$pkgdir/opt/d2x-xl/data/descent.hog"
	install -m644 DESCENT.PIG "$pkgdir/opt/d2x-xl/data/descent.pig"
	install -m644 DESCENT2.HAM "$pkgdir/opt/d2x-xl/data/descent2.ham"
	install -m644 DESCENT2.HOG "$pkgdir/opt/d2x-xl/data/descent2.hog"
	install -m644 DESCENT2.S11 "$pkgdir/opt/d2x-xl/data/descent2.s11"
	install -m644 DESCENT2.S22 "$pkgdir/opt/d2x-xl/data/descent2.s22"
	install -m644 FIRE.PIG "$pkgdir/opt/d2x-xl/data/fire.pig"
	install -m644 GROUPA.PIG "$pkgdir/opt/d2x-xl/data/groupa.pig"
	install -m644 ICE.PIG "$pkgdir/opt/d2x-xl/data/ice.pig"
	install -m644 WATER.PIG "$pkgdir/opt/d2x-xl/data/water.pig"
	install -m644 INTRO-H.MVL "$pkgdir/opt/d2x-xl/movies/intro-h.mvl"
	install -m644 OTHER-H.MVL "$pkgdir/opt/d2x-xl/movies/other-h.mvl"
	install -m644 ROBOTS-H.MVL "$pkgdir/opt/d2x-xl/movies/robots-h.mvl"
	install -m644 ROBOTS-L.MVL "$pkgdir/opt/d2x-xl/movies/robots-l.mvl"
	find "$pkgdir/opt/d2x-xl" -type d -exec chmod 755 {} \;
}
# vim:syntax=sh
