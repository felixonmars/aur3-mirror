# Maintainer: ssf <punx69 at gmx dot net>
pkgname=lxqt-theme-glare-svn
pkgver=r453
pkgrel=1
pkgdesc="a glare matching lxqt theme"
arch=("any")
url="http://sixsixfive.deviantart.com/art/Glare-494114516"
license=("CCPL:cc-by-sa-4.0")
depends=()
optdepends=('xfce-theme-glare-svn: for GTK+ support' 'kvantum-theme-glare: for Qt4/5 support')
makedepends=('subversion' 'sed' 'gawk')
provides=("lxqt-theme-glare=${pkgver}")
conflicts=()
replaces=()
source=()
sha384sums=()
sha512sums=()

_svntrunk=https://github.com/sixsixfive/Glare/trunk/Glare-misc
_svnmod=Glare

pkgver() {
  printf "$(svn log $_svntrunk | awk 'NR==2' | awk '{print $1}')"
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
	cd ${srcdir}/${_svnmod}
	mkdir -p ${pkgdir}/usr/share/lxqt/themes
	cp -R lxqt/Glare ${pkgdir}/usr/share/lxqt/themes/Glare
}
