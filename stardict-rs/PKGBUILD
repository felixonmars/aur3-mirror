# Maintainer: olujicz <olujicz@gmail.com>

pkgname=stardict-rs
pkgver=2.4.2
pkgrel=1
pkgdesc="English Serbian dictionary for Stardict"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('7c6860c7ebe0326968e80f8772b73f95')

source=(http://garr.dl.sourceforge.net/sourceforge/stardict/stardict-jdict-EngSerbian-2.4.2.tar.bz2)
arch=('i686' 'x86_64')

build() {
        cd $startdir/src/stardict-jdict-EngSerbian-$pkgver
        mkdir -p $startdir/pkg/usr/share/stardict/dic/
        install -m 644 jdict-English_Serbian.dict.dz   $startdir/pkg/usr/share/stardict/dic/
        install -m 644 jdict-English_Serbian.idx       $startdir/pkg/usr/share/stardict/dic/
        install -m 644 jdict-English_Serbian.ifo       $startdir/pkg/usr/share/stardict/dic/
}

