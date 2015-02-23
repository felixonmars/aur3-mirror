# Maintainer: ssf <punx69 at gmx dot net>
pkgname=xfce-theme-glare-svn
pkgver=r454
pkgrel=1
pkgdesc="A simple theme for GTK2, GTK3, Xfce notify, Xfwm & Marco"
arch=("any")
url="http://sixsixfive.deviantart.com/art/Glare-494114516"
license=("CCPL:cc-by-sa-4.0")
depends=()
optdepends=('gtk-engines: for GTK2 support' 'gtk2: for GTK2 support' 'gtk3: for GTK3 support' 'kvantum-theme-glare-svn: for Qt4/5 support')
makedepends=('subversion' 'yad' 'sed' 'imagemagick' 'coreutils' 'findutils' 'gawk' 'grep')
provides=("xfce-theme-glare=$pkgver")
conflicts=()
replaces=()
source=()
_svntrunk=https://github.com/sixsixfive/Glare/trunk/Glare-xfce
_svnmod="Glare"

pkgver() {
	svn log $_svntrunk --config-dir "$srcdir" | awk 'NR==2' | awk '{print $1}'
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
	cp -R ./* "$pkgdir"/usr/share/themes/"$_svnmod"
	rm -drf "$pkgdir"/usr/share/themes/"$_svnmod"/.svn
	rm -f "$pkgdir"/usr/share/themes/"$_svnmod"/README.md
	cd "$pkgdir"/usr/share/themes/
	ln -sf Glare/extras/Glare-cupertino
	ln -sf Glare/extras/Glare-compact
	ln -sf Glare/extras/Glare-windowck
	ln -sf Glare/extras/Glare-cupertino-windowck
	mkdir -p "$pkgdir"/usr/share/backgrounds/xfce
	cd "$pkgdir"/usr/share/backgrounds/xfce
	ln -sf ../../themes/Glare/extras/wallpaper-patterns/Glare_pattern_dark-01.png
	ln -sf ../../themes/Glare/extras/wallpaper-patterns/Glare_pattern_trans-01.png
	mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"
	cd "$pkgdir"/usr/share/licenses/"$pkgname"
	ln -sf ../../themes/Glare/COPYING LICENSE
	cd "$pkgdir"/usr/share/themes/"$_svnmod"
	printf "Would you like to change the highlight/selection color now?: [y/N] \n"
	read input
	if [ "$input" = "y" ]; then
		msg "executing color script."
		./changecolor.sh
	else
		msg "skipped"
	fi
}
