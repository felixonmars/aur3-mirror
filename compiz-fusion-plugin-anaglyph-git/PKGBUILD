# Contributor: Prurigro
# Maintainer: Prurigro

pkgname=compiz-fusion-plugin-anaglyph-git
pkgver=20091017
pkgrel=1
pkgdesc="Compiz-fusion Anaglyph plugin - Three dimensional effects in combination with 3D glasses"
arch=('i686' 'x86_64')
url="http://gitweb.opencompositing.org/?p=users/wodor/anaglyph"
license=('GPL')
makedepends=('git' 'intltool' 'pkgconfig' 'gettext')
source=()
md5sums=()

# This sets the depends based on whether you have compiz-core or compiz-git installed
if [ ! -f /usr/bin/compiz ]; then
	echo -n "Please install either 'compiz-core' or 'compiz-git' and try again"
	return 1
elif [ $(pacman -Qo /usr/bin/compiz | grep -c compiz-core) = 1 ]; then
	depends=('compiz-core' 'compiz-bcop' 'compiz-fusion-plugins-main')
elif [ $(pacman -Qo /usr/bin/compiz | grep -c compiz-git) = 1 ]; then
	depends=('compiz-git' 'compiz-bcop-git' 'compiz-fusion-plugins-main-git')	
fi

_gitroot="git://anongit.compiz-fusion.org/users/wodor/anaglyph"
_gitname="anaglyph"

build() {
	rm -rf "$startdir"/src || return 1
	install -d "$startdir"/src || return 1

	echo "Connecting to opencompositing.org GIT server...." || return 1

	pushd "$startdir"/src || return 1
		git clone $_gitroot || return 1
	popd || return 1

	echo "GIT checkout done" || return 1
	echo "Starting make..." || return 1

	install -d "$startdir"/src/$_gitname-build || return 1
	install -D -m644 "$startdir"/src/$_gitname/* "$startdir"/src/$_gitname-build || return 1

	pushd "$startdir"/src/$_gitname-build || return 1
		make || return 1
		make DESTDIR="$startdir"/pkg/usr/lib/compiz install || return 1
		install -d "$startdir"/pkg/usr/share/compiz || return 1
		install -D $_gitname.xml.in ${startdir}/pkg/usr/share/compiz/$_gitname.xml || return 1
	popd
}

