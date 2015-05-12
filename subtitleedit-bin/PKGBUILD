# Maintainer: Faheem Pervez <trippin1 bei g-to-the-m-to-the-a-to-the-i-to-the-l>
pkgname=subtitleedit-bin
pkgver=3.4.6
pkgrel=1
pkgdesc="A primarily Windows-oriented, Mono-based subtitle (SRT etc.) editor"
arch=('any')
url="http://www.nikse.dk/subtitleedit/"
license=('GPL3')
depends=('mono' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('icoutils')
optdepends=('mplayer2: visually sync subtitles with videos'
	    'hunspell: spell checking')
options=('!strip')
install="$pkgname.install"
_seditzip="SE${pkgver//./}.zip"
source=("https://github.com/SubtitleEdit/subtitleedit/releases/download/${pkgver}/$_seditzip"
	'subtitleedit.desktop'
	'subtitleedit-launcher')
noextract=("${_seditzip}") # doesn't extract to its own folder
backup=('opt/subtitleedit/Settings.xml') #User etc. dictionary files are added below
sha1sums=('6471a4d4a6d75dfeb9a43a4492afb11778b8eb26'
	  '78ae949ff9ac35f3274e352d7b95f692b94ac4d6'
	  'fc92954aec931d1b6239190544cf1ace51e49912')

prepare() {
	mkdir "$srcdir/$pkgname-$pkgver" "$srcdir/ico"
	cd "$srcdir/$pkgname-$pkgver"

	bsdtar -xf "$srcdir/$_seditzip"
	wrestool -x --output="$srcdir/ico" --type=14 SubtitleEdit.exe
	for i in "$srcdir/ico/"SubtitleEdit.exe_*.ico; do 
		icotool -x --output="$srcdir/ico" "$i"
	done
}

package() {
	for i in "$srcdir/ico/"SubtitleEdit.exe_*x32.png; do
	  local _icon_base="${i##*_}"
	  install -D -m 644 "$i" "$pkgdir/usr/share/icons/hicolor/${_icon_base%x32*}/apps/subtitleedit.png"
	done
	install -D -m 644 -t "$pkgdir/usr/share/applications/" "$srcdir/subtitleedit.desktop"
	install -D -m 755 "$srcdir/subtitleedit-launcher" "$pkgdir/usr/bin/subtitleedit"

	install -d -m 755 "$pkgdir/opt/subtitleedit"
	cp -a -T "$srcdir/$pkgname-$pkgver/" "$pkgdir/opt/subtitleedit/"
	rm -f "$pkgdir/opt/subtitleedit/gpl.txt" # /usr/share/licenses/common/GPL3/license.txt
	# Remove Windows-only executables
	for i in 64 86; do
		rm -f "$pkgdir/opt/subtitleedit/Hunspellx$i.dll"
	done
	for i in msvcp90.dll msvcr90.dll tesseract.exe; do rm -f "$pkgdir/opt/subtitleedit/Tesseract/$i"; done

	#SE stores all of its settings and changes to its dictionaries in the folder where it is installed
	#So allow users to write to those files without chmodding 777 the entire SE folder
	#Repos should be the first place to find dicts but allow SE's dictionary download feature to work nevertheless:
	chmod 777 "$pkgdir/opt/subtitleedit/Dictionaries"
	#Words can be added by the user in SE's settings, so account for that here
	for i in "$pkgdir/opt/subtitleedit/Dictionaries/"*.xml; do 
		backup+=("${i##*${pkgdir}/}")
	done
	for i in "${backup[@]}"; do
	  test -f "$pkgdir/$i" || touch "$pkgdir/$i"
	  chmod 666 "$pkgdir/$i"
	done
}
