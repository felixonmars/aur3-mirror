# Maintainer: Dominik Heidler <dheidler@gmail.com>

pkgname="entangled-svn"
pkgver=163
pkgrel=1
pkgdesc="A distributed hash table (DHT) based on Kademlia"
arch=('any')
license=('LGPL3')
url="http://entangled.sourceforge.net/"
depends=('python2' 'twisted')
makedepends=('subversion' 'python2-distribute')
provides=('entangled')
conflicts=('entangled')
optdepends=('python-pysqlite: for SQlite datastore'
						'pygtk: for UI examples')
source=()
md5sums=()

_svntrunk=https://entangled.svn.sourceforge.net/svnroot/entangled/entangled
_svnmod=entangled

build() { 
	cd $srcdir

	# checking out or updating code
	echo "Downloading sources from SVN..."
	if [[ -d "$_svnmod" ]]; then
		svn up -r $pkgver
	else
		svn co $_svntrunk -r $pkgver $_svnmod
	fi

	# copying files..
	echo "Copying files..."
	cd $srcdir/$_svnmod

	# first copying django
	python2 setup.py install --root=$pkgdir --optimize=1 || return 1

	# copying license information
	install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE

	# copying readme information
	install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README

	# copying code examples
	mkdir $pkgdir/usr/share/doc/$pkgname/examples/
	install -m755 examples/*.py $pkgdir/usr/share/doc/$pkgname/examples/

	# fix for py2k
	find $pkgdir/usr/lib/python2.7/site-packages/entangled/ $pkgdir/usr/share/doc/$pkgname/examples/ -name '*.py' | \
		xargs sed -i "s|#!./usr/bin/env python$|#!/usr/bin/env python2|"
}
