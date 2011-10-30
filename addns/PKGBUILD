# Maintainer: Aurélien Chabot <contact@aurelienchabot.fr>

pkgname=addns
_short_pkgver=1.2
pkgver=${_short_pkgver}a
pkgrel=1
pkgdesc="addns : a dyndns syncing script"
arch=('any')
url="http://www.funtaff.com/software/addns.pl"
license=('GPL')
depends=('perl')
provides=('addns')
source=(http://www.funtaff.com/software/$pkgname.pl/$pkgname-$pkgver.tar.gz)
md5sums=('cc5e2637bcfb9aa4b319bed4fa9831b6')

package() {
	tar xvfz $pkgname-$pkgver.tar.gz
	install -Dm755 $pkgname-${_short_pkgver}/$pkgname.pl $pkgdir/usr/bin/$pkgname
	install -Dm755 $pkgname-${_short_pkgver}/$pkgname.conf.sample $pkgdir/etc/$pkgname.conf
}
