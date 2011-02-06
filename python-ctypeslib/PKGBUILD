#Contributor: twa022 <twa022 at gmail dot com>

pkgname=python-ctypeslib
pkgdesc="code generator to convert header files into ctypes interfaces"
pkgver=77594
pkgrel=1
arch=('any')
url="http://code.google.com/p/fusepy/"
license=('Custom')
depends=('python2')
makedepends=('svn' 'python2-distribute')

_svntrunk=http://svn.python.org/projects/ctypes/trunk/ctypeslib/
_svnmod=$pkgname

build() {
	
	cd $srcdir
	if [ -d $_svnmod/.svn ]; then
		( cd $_svnmod && svn up )
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or sever timeout"
	msg "Starting make..."

	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build
	python2 setup.py install --root=$pkgdir || return 1
	install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licences/$pkgname
	ln -s /usr/bin/h2xml.py $pkgdir/usr/bin/h2xml
	ln -s /usr/bin/xml2py.py $pkgdir/usr/bin/xml2py
} 
