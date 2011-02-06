# Contributor: Dragonlord <dragonlord@seznam.cz>
pkgname=stardict-ldaf
pkgver=2.4.2
pkgrel=1
pkgdesc="LDaF (Langenscheidt Großwörterbuch: Deutsch als Fremdsprache) dictionary for StarDict"
arch=(i686)
url="http://stardict.sourceforge.net"
license='unknown'
depends=('stardict')
source=(http://downloads.sourceforge.net/stardict/$pkgname-$pkgver.tar.bz2)

md5sums=('b35a51ba27091ef59251ab84dd7a0860')

build() {
	cd $startdir/src/$pkgname-$pkgver
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	install -m 644 ldaf.dict.dz ldaf.idx ldaf.ifo $startdir/pkg/usr/share/stardict/dic/
}
