# Maintainer: Vitaliy Berdinskikh <skipper13@i.ua>
pkgname=cfgconv
pkgver=0.3
pkgrel=2
pkgdesc="XML to BIN and BIN to XML config convertor for firmwares v.3.6.х and above ADSL chipset Texas Instrument AR7"
arch=(i686 x86_64)
url="http://mcmcc.bat.ru/"
license="GPL2"
depends=('zlib')
source=(http://mcmcc.bat.ru/acorp/utils/${pkgname}-${pkgver}.tar.bz2)
md5sums=('cd604ba94f99d26267c40668c251cb54')

build() {
	cd $startdir/src/${pkgname}-${pkgver}
	rm cfgconv
        make || return 1
	install -D cfgconv $startdir/pkg/usr/bin/cfgconv || return 1
}
