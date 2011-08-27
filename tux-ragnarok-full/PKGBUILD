# Maintainer: Phillipe Smith <phillipe@archlinux.com.br>
pkgname=tux-ragnarok-full
pkgver=1.4
pkgrel=1
pkgdesc="Ragnarok MMORPG Game for Linux - Full Version"
arch=('i686' 'x86_64')
url="http://tuxro.ubuntugames.org/"
license=('Other')
depends=('wine' 'zenity')
source=(http://69.162.78.198/${pkgname}-v.${pkgver}_all.deb)
md5sums=('74ac2790ecf813c3253379793a68f356')

build() {
	ar -x ${pkgname}-v.${pkgver}_all.deb data.tar.gz || return 1
	tar -zxvf data.tar.gz || return 1
	cp -rf usr/ ${pkgdir}
}
