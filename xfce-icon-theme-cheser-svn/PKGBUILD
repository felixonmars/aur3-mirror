# Maintainer: ssf <punx69 at gmx dot net>

pkgname=xfce-icon-theme-cheser-svn
pkgver=r83
pkgrel=1
pkgdesc="An extended/remixed version of the default GNOME icon theme"
arch=("any")
url="https://github.com/chekavy/cheser-icon-theme"
license=("CCPL:cc-by-sa-3.0-US")
makedepends=('subversion' 'gtk-update-icon-cache' 'curl' 'sed' 'findutils' 'gawk' 'grep')
optdepends=('adwaita-icon-theme: for missing icons' 'gnome-icon-theme: for missing icons' 'gnome-icon-theme-extras: for missing icons' 'gnome-icon-theme-symbolic: for missing icons')
provides=("xfce-icon-theme-cheser=${pkgver}")
_svntrunk=https://github.com/chekavy/cheser-icon-theme/trunk/Cheser
_svnmod=$pkgname
_copying=https://raw.githubusercontent.com/chekavy/cheser-icon-theme/master/COPYING

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
	msg "getting COPYING"
	curl -L "$_copying" > COPYING
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/icons"
	cp -R "$_svnmod" "$pkgdir/usr/share/icons/cheser"
	rm -drf "$pkgdir/usr/share/icons/cheser/.svn"
	gtk-update-icon-cache "$pkgdir/usr/share/icons/cheser"
	install -Dm644 "$srcdir"/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
