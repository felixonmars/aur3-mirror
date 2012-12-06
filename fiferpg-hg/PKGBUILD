# Maintainer: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=fiferpg-hg
pkgver=1
pkgrel=1
pkgdesc="FIFErpg is a framework for creating games utilizing a component-based entity system. It uses the FIFEngine and a modified version of the Grease framework."
arch=(any)
url="http://fiferpg.bitbucket.org"
license=('GPL3')
depends=('python2>=2.7' 'fife-svn' 'python2-yaml' 'bgrease-git')
makedepends=('mercurial')

_hgroot="https://bitbucket.org/"
_hgrepo="fiferpg/fife-rpg"

build() {
	cd "$srcdir"
	msg "Connecting to Mercurial server...."

	if [[ -d "$_hgrepo" ]]; then
		cd "$_hgrepo"
		hg pull -u
		msg "The local files are updated."
	else
		hg clone "$_hgroot" "$_hgrepo"
	fi

	msg "Mercurial checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_hgrepo-build"
	cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
	cd "$srcdir/$_hgrepo-build"
  python2 setup.py install --home=$pkgdir/usr || return 1
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/
  mv $pkgdir/usr/lib/python/* $pkgdir/usr/lib/python2.7/site-packages/
  rm -rf $pkgdir/usr/lib/python
}

# vim:set ts=2 sw=2 et:
