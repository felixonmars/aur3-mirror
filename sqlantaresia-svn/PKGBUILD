# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=sqlantaresia-svn
pkgver=57
pkgrel=3
pkgdesc="SQL Antaresia is a MySQL administrative tool aimed at developers and sysadmins"
arch=(any)
url="http://sqlantaresia.googlecode.com"
license=('MIT')
depends=('python2-qt' 'mysql-python' 'python-dbutils' 'python2-qscintilla')
optdepends=('python-paramiko: for automatic ssh tunnelling')
makedepends=('subversion')
conflicts=('sqlantaresia')
provides=('sqlantaresia')
source=('sqlantaresia.sh' 'sqlantaresia.desktop')
md5sums=('3e0a34634eea5a8c3a11a6a5982b2aff'
         'e943216b91352debf3a13fe8834701d5')

_svntrunk=http://sqlantaresia.googlecode.com/svn/trunk/
_svnmod=sqlantaresia

build() {
	cd "$srcdir"

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"

	rm -rf "$srcdir/$_svnmod-build"
	cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build"
	sh build.sh

	cd src
	python2 -Oc "from compileall import compile_dir; compile_dir('.', force=True, maxlevels=0)"
	for _pysrc in *.py; do
		install -D -m644 ${_pysrc} $pkgdir/usr/lib/python2.7/site-packages/sqlantaresia/${_pysrc}
		install -D -m644 ${_pysrc}o $pkgdir/usr/lib/python2.7/site-packages/sqlantaresia/${_pysrc}o
	done
	cd ..

	install -D -m644 src/kexi.png $pkgdir/usr/share/pixmaps/sqlantaresia.png
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/sqlantaresia/LICENSE
	install -D -m644 $srcdir/sqlantaresia.desktop $pkgdir/usr/share/applications/sqlantaresia.desktop
	install -D -m755 $srcdir/sqlantaresia.sh $pkgdir/usr/bin/sqlantaresia
}
