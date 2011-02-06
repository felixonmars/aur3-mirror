# Contributor: xduugu
pkgname=jgit-git
pkgver=20090822
pkgrel=1
pkgdesc="A 100% pure java implementation of git"
arch=('i686' 'x86_64')
url="http://www.jgit.org/"
license=('BSD')
depends=('java-runtime')
makedepends=('git' 'java-environment')
conflicts=('jgit')

_gitroot="git://repo.or.cz/jgit.git"
_gitname="jgit"

build() {
	msg "Connecting to GIT server...."

	if [ -d "$_gitname" ] ; then
		(cd "$_gitname" && git pull origin)
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$_gitname" "$_gitname-build" || return 1
	cd "$srcdir/$_gitname-build"

	# build jgit
	sh make_jgit.sh || return 1

	# include some files which are needed by eclipse
	sed -i "s/^\(Bundle-Version:.*\)qualifier$/\1$(date +%Y%m%d%H%M)/" \
			org.spearce.jgit/META-INF/MANIFEST.MF &&
	jar ufm jgit.jar org.spearce.jgit/META-INF/MANIFEST.MF \
			-C org.spearce.jgit plugin.properties || return 1

	# update provides array
	[ 1 ] && provides=('jgit='$(grep Bundle-Version \
							org.spearce.jgit/META-INF/MANIFEST.MF | cut -f2 -d' '))

	# install files
	install -D -m755 jgit "$pkgdir/usr/bin/jgit" &&
	install -D -m644 jgit.jar \
		"$pkgdir/usr/share/java/${pkgname%-*}/org.spearce.jgit.jar" || return 1
}

# vim:set ts=2 sw=2 noet:
