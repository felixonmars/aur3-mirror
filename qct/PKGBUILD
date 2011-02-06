# Contributor: <sagikliwon@gmail.com>

pkgname=qct
pkgver=552
pkgrel=1
pkgdesc="QT commit tool"
url="http://qct.sourceforge.net/"
license='GPL'
arch=('i686' 'x86_64')
depends=('python' 'pyqt')
makedepends=('mercurial')
source=()
md5sums=()

_hgroot='http://bitbucket.org/sborho/'
_hgrepo='qct'

build() {
	cd $startdir/src

	# update the repo, else clone a new one
	if [ -d $_hgrepo ]; then
		cd $_hgrepo
		make clean
		hg pull -u
	else
		hg clone ${_hgroot}/${_hgrepo}
		cd $_hgrepo
	fi

 	make || return 1
  	python setup.py install --root=$startdir/pkg || return 1

	mkdir -p $startdir/pkg/usr/lib/python2.6/site-packages/hgext/
	cp plugins/qct.py $startdir/pkg/usr/lib/python2.6/site-packages/hgext/

  	mkdir -p $startdir/pkg/usr/share/qct/plugins/
  	cp plugins/qctBzrPlugin.py $startdir/pkg/usr/share/qct/plugins/
}