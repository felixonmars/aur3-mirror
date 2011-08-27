# Contributor: Zerial <fernando@zerial.org>

pkgname=amispammer
pkgver=3
pkgrel=1
pkgdesc="Powerful mail server checker on blacklists. Am I spammer?"
arch=('i686')
url="http://www.lorenzomartinez.es/projs/amispammer/"
license=('GPL')
depends=('perl' 'perl-net-dns' 'perl-mail-sender')
source=(http://www.lorenzomartinez.es/projs/amispammer/amispammer_v$pkgver.zip)
md5sums=('8d7667d712064abb42f30d601a336dee')

build() {
	install -D -m755 $startdir/src/amISpammer.pl $startdir/pkg/usr/bin/amispammer
}


