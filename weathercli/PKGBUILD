# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>

pkgname=weathercli
pkgver=2009.08.20
pkgrel=1
pkgdesc="Bash script for CLI to retrive weather from weatherbug.com"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/weathercli"
license=('GPL3')
depends=('bash')
source=(http://downloads.sourceforge.net/project/$pkgname/v2/$pkgname.tar.gz)
md5sums=('75fe496a53f0eb488de8a90d635fe506')

package() {
	cd $srcdir/$pkgname

	install -d $pkgdir/usr/bin
	install -m755 weather $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
