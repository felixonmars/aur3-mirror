# Contributor: Evgenij Vdovin <evdovin@pochta.ru>

pkgname=thunderbird-spell-ru-us
pkgver=2.0
pkgrel=3
pkgdesc="Russian-English spellchecker dictionary for Thunderbird"
arch=('i686' 'x86_64')
url="http://mozutil.mozilla-russia.org/dict/"
license=('GPL')
depends=('thunderbird')
source=(http://mozutil.mozilla-russia.org/dict/spell-${pkgrel}.zip)
md5sums=('75daff84bac8bf4ab62874d1b44527aa')

build(){
	cd $startdir/src/
	install -D -m644 RU_US.aff $startdir/pkg/usr/lib/${pkgname/-spell-ru-us/}-${pkgver}/dictionaries/ru-us-RU.aff || return 1
	install -D -m644 RU_US.dic $startdir/pkg/usr/lib/${pkgname/-spell-ru-us/}-${pkgver}/dictionaries/ru-us-RU.dic || return 1
}
