# Maintainer: ssf <punx69 at gmx dot net>

pkgname=gtk-theme-glare-svn
pkgver=r537
pkgrel=1
pkgdesc="A simple and bright theme(includes gtk2, gtk3, xfwm, xfce, marco/muffin & openbox themes)"
arch=("any")
url="http://xfce-look.org/content/show.php/Glare?content=168762"
license=("CCPL:cc-by-sa-4.0")
depends=()
optdepends=('gtk-engines: req for the GTK+2 theme'
'gtk3: Includes a GTK+3 theme'
'Xfwm4: Includes Xfwm4 themes'
'marco: Includes Marco themes'
'muffin: Includes Muffin themes'
'openbox: Includes Openbox themes'
'xfce4-notifyd: Includes a Xfce4 notify theme'
'xfce4-windowck-plugin: Includes Xfce4 windowck plugin themes'
'glare-theme-misc-svn: Additional themes (Qt, LXQt etc.)'
'xfce-icon-theme-ivy-svn: The recommended X11 icon theme')
makedepends=('subversion' 'sed' 'bc' 'imagemagick' 'coreutils' 'findutils' 'gawk' 'grep')
provides=("gtk-theme-glare=$pkgver")
conflicts=()
replaces=('xfce-theme-glare')
source=()
_svntrunk=https://github.com/sixsixfive/Glare/trunk/Glare-main
_svnmod="Glare"

pkgver() {
	svn log https://github.com/sixsixfive/Glare/trunk --config-dir "$srcdir"|awk 'NR==2 {print $1}'
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
}

package() {
	cd "$srcdir"/"$_svnmod"
	mkdir -p "$pkgdir"/usr/share/themes/"$_svnmod"
	cp -R "$srcdir"/"$_svnmod"/* "$pkgdir"/usr/share/themes/"$_svnmod"
	rm -drf "$pkgdir"/usr/share/themes/"$_svnmod"/.svn
	rm -f "$pkgdir"/usr/share/themes/"$_svnmod"/README.md
	cd "$pkgdir"/usr/share/themes
	ln -s Glare/extras/wmthemes/Glare-cupertino
	ln -s Glare/extras/wmthemes/Glare-cupertino-dusK-x1.5
	ln -s Glare/extras/wmthemes/Glare-cupertino-dusK
	ln -s Glare/extras/wmthemes/Glare-cupertino-windowck
	ln -s Glare/extras/wmthemes/Glare-windowck
	ln -s Glare/extras/wmthemes/Glare-compact
	cd "$pkgdir"/usr/share/themes/Glare
	printf "Would you like to change the highlight/selection color now?: [y/N] \n"
	read input
	case $input in
		[yY])
			printf "executing color script.\n"
			./changecolor.sh;;
		*)
			printf "skipped\n";;
	esac
}
