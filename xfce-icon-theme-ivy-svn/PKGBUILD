# Maintainer: ssf <punx69 at gmx dot net>

pkgname=xfce-icon-theme-ivy-svn
pkgver=r303
pkgrel=1
pkgdesc="A very minimalistic tango like icon theme"
arch=("any")
url="http://sixsixfive.deviantart.com/art/Ivy-371216510"
license=("CCPL:cc-by-sa-4.0")
depends=('hicolor-icon-theme')
optdepends=('tango-icon-theme: for missing icons' 'gtk-theme-glare: the recommend gui theme' 'glare-theme-misc: the recommend gui theme part 2')
makedepends=('subversion')
provides=("xfce-icon-theme-ivy=$pkgver")
_svntrunk=https://github.com/sixsixfive/ivy/trunk
_svnmod="$pkgname"

pkgver() {
	svn log $_svntrunk --config-dir "$srcdir" | awk 'NR==2 {print $1}'
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
	mkdir -p "$pkgdir"/usr/share/icons
	cp -R "$srcdir"/"$_svnmod"/Ivy "$pkgdir"/usr/share/icons/Ivy
	cp -R "$srcdir"/"$_svnmod"/misc/Ivy-MATE "$pkgdir"/usr/share/icons/Ivy-MATE
	cp -R "$srcdir"/"$_svnmod"/misc/Ivy-LXQt "$pkgdir"/usr/share/icons/Ivy-LXQt
	##avoid the lzma packing
	export PKGEXT='.pkg.tar'
}
