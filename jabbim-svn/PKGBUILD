# Contributor: scippio <scippio@seznam.cz>
# Changes: kotyz <kotyz.king@gmail.com>
# Changes: kamahl <jachymb@gmail.com>
# Changes: jlaunay <jerome@projet-libre.org>

pkgname=jabbim-svn
pkgver=4375
pkgrel=4
pkgdesc="Jabber client written in PyQT with Pyxl library"
arch=('i686' 'x86_64')
provides=('jabbim')
conflicts=('jabbim')
license=('GPL')
url="http://dev.jabbim.cz/jabbim"
depends=('python2' 'qt>=4.4' 'python2-pyqt>=4.4' 'python2-pyopenssl' 'twisted>=8.2.0' 'twisted-web2' 'python2-pysqlite' 'python2-configobj')
makedepends=('subversion' 'sed')
install=jabbim.install
source=()
md5sums=()

_svntrunk=svn://dev.jabbim.cz/jabbim/trunk
_svnmod=jabbim

build() {
cd "$srcdir"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
fi

msg "SVN checkout done or server timeout"
msg "Starting make..."
cd jabbim

sed -i 's/lrelease-qt4/lrelease/g' Makefile || return 1
sed -i 's:PREFIX =.*:PREFIX = /usr/:' Makefile || return 1
sed -i 's/images\//resources\/images\//g' Makefile || return 1
sed -i "9c jabbimdata = \$(datadir)/jabbim/src" Makefile|| return 1
sed -i 's/python/python2/g' Makefile || return 1
sed -i 's/pyuic4/python2-pyuic4/g' Makefile || return 1
sed -i 's:/usr/local/share/jabbim:/usr/share/jabbim/:' jabbim.sh || return 1

make || return 1
make DESTDIR="$pkgdir" install

cd "$pkgdir/usr/bin/"
sed -i 's/python/python2/g' jabbim || return 1
}
