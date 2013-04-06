# Maintainer: CasualSuperman <robert.wertman@gmail.com>

pkgname=gtkradiant-gamepack-ja
pkgver=1.6
pkgrel=1
pkgdesc="Jedi Academy gamepack for gtkradiant"
arch=('x86_64' 'i686')
url="http://www.qeradiant.com/cgi-bin/trac.cgi/wiki/ZeroRadiant"
license=('unknown')
depends=('gtkradiant')
source=("https://github.com/jkaopenbase/JAPack/archive/master.zip")
md5sums=('51180a67ba459050959d3b0502927e2b')

package() {
	mkdir -p "$pkgdir/usr/share/gtkradiant/installs"
	cp -r "$srcdir/JAPack-master" "$pkgdir/usr/share/gtkradiant/installs/JAPack"
	chmod -R o+r "$pkgdir/usr/share/gtkradiant/installs/"
}
