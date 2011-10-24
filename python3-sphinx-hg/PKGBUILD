#Contributor: limyreth <limyreth[at]gmail.com>

pkgname=python3-sphinx-hg
provides=python-sphinx
conflicts=('python-sphinx' 'python-sphinx-hg')
replaces=('python-sphinx')
pkgver=20100307
pkgrel=4
pkgdesc="development version of Sphinx, *the* documentation generator"
url="http://sphinx.pocoo.org/latest/"
license="BSD"
arch=('any')
depends=('python-distribute' 'python-pygments' 'python3-jinja2' 'python-docutils')
makedepends=('mercurial')
source=()
md5sums=()

_hgroot="http://bitbucket.org/birkenfeld/sphinx"
_hgname="sphinx"

build() {
	cd $startdir/src
	msg "Connecting to $_hgroot server..."

	if [ -d $startdir/src/$_hgname ] ; then
		cd $_hgname && hg pull && hg update
		msg "The local files are updated."
	else
		hg clone $_hgroot
	fi

	msg "Mercurial checkout done or server timeout"

	msg "Copying files..."

	cp -r $startdir/src/$_hgname $startdir/src/$_hgname-build
	cd $startdir/src/$_hgname-build

    python setup.py install --root=$startdir/pkg || return 1
}

