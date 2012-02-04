#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=paconky
pkgver=2010.09.28.1
pkgrel=2
pkgdesc="displays repo and AUR pkg info in conky"
depends=('bash-xyne-common_functions')
arch=('any')
license=('GPL')
url="http://xyne.archlinux.ca/old_projects/${pkgname}"
source=(http://xyne.archlinux.ca/src/${pkgname}-${pkgver}.tar.gz)
md5sums=('09dc9f858fab0dc3e5542740137eb403')
#backup=(etc/paconky.conf)

build() {
  install -D -m755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 "$srcdir/$pkgname/man/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
# vim: set ts=2 sw=2 et:
