# Contributor: schmoemi <schmoemi at arcor dot de>
# Contributor: DuGi <dugi at irc dot pl>

pkgname=spring-mod-ca
pkgver=8405
pkgrel=1
pkgdesc="Complete Annihilation - RTS game for the  Spring engine."
arch=('any')
url="http://trac.caspring.org/"
license=('GPL')
depends=('spring')
source=(http://packages.caspring.org/builds/ca-stable-${pkgver}.sdz
	http://packages.caspring.org/builds/ca-1faction-stable-${pkgver}.sdz)
md5sums=('b768460428178d053fc713d8583438d7'
         '42197cf3f42cfd61b072a5b77c4dc0ec')

build() {
	mkdir -p $pkgdir/usr/share/spring/mods
	install -m 644 -t $pkgdir/usr/share/spring/mods $srcdir/ca-stable-${pkgver}.sdz $srcdir/ca-1faction-stable-${pkgver}.sdz
}

