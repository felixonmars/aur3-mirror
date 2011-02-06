# Contributor: fill <mailbox@fillo.ru>

pkgname=isida-svn
pkgver=312
pkgrel=3
pkgdesc="Isida is jabber bot."
arch=('i686' 'x86_64')
url="http://code.google.com/p/isida/"
license=('GPL3')
depends=('python25' 'xmpppy' 'sqlite3')
makedepends=('subversion')
install=isida.install
source=(isida.rc)
md5sums=('e7b96ecfc12714da53e4095f75f278a5')

_svntrunk=http://isida.googlecode.com/svn/trunk
_svnmod=isida

build() {
	cd $srcdir

	svn co $_svntrunk $_svnmod

	mkdir -p $pkgdir/usr/share
	cp -r $_svnmod $pkgdir/usr/share

	install -Dm 0755 $srcdir/isida.rc $pkgdir/etc/rc.d/isida
}
