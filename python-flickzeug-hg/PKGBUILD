# Contributor: Philipp Schmidt <philschmidt at gmx dot net>

pkgname=python-flickzeug-hg
pkgver=60
pkgrel=1
pkgdesc="The Swiss Army knife of Python web development debugging."
arch=('i686' 'x86_64')
url="http://dev.pocoo.org/projects/flickzeug/"
license=('Custom')
depends=('python')
makedepends=('mercurial' 'setuptools')
source=()
md5sums=()

_hgroot="http://dev.pocoo.org/hg/flickzeug-main"
_hgrepo="flickzeug"

build() {
	cd "$srcdir"
	msg "Connecting to Mercurial server...."

	if [ -d $_hgrepo ] ; then
	    cd $_hgrepo
	    hg pull -u || return 1
	    msg "The local files are updated."
	else
	    hg clone $_hgroot $_hgrepo || return 1
	fi

	msg "Mercurial checkout done or server timeout"

	rm -rf "$srcdir/$_hgrepo-build"
	cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
	cd "$srcdir/$_hgrepo-build"

	msg "Starting setup.py..."

	python setup.py install --root=$pkgdir/
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
