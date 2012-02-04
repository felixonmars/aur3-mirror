# Maintainer: muczy <muczyjoe@gmail.com>
pkgname=stardict-hu
pkgver=2.4.2
pkgrel=2
pkgdesc="English Hungarian dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(
	http://prdownloads.sourceforge.net/stardict/stardict-freedict-eng-hun-$pkgver.tar.bz2
	http://prdownloads.sourceforge.net/stardict/stardict-freedict-hun-eng-$pkgver.tar.bz2
	)
md5sums=('eb8b3092bc1c7244bdac486bb5e26e8c'
         '97f4de2681a0a0754a0ec76f73c239ea')

build() {
        cd $srcdir/stardict-freedict-eng-hun-$pkgver
        mkdir -p $pkgdir/usr/share/stardict/dic/
        install -m 644 dictd_www.freedict.de_eng-hun.dict.dz   $pkgdir/usr/share/stardict/dic/
        install -m 644 dictd_www.freedict.de_eng-hun.idx       $pkgdir/usr/share/stardict/dic/
        install -m 644 dictd_www.freedict.de_eng-hun.ifo       $pkgdir/usr/share/stardict/dic/

        cd $srcdir/stardict-freedict-hun-eng-$pkgver
        mkdir -p $pkgdir/usr/share/stardict/dic/
        install -m 644 dictd_www.freedict.de_hun-eng.dict.dz   $pkgdir/usr/share/stardict/dic/
        install -m 644 dictd_www.freedict.de_hun-eng.idx       $pkgdir/usr/share/stardict/dic/
        install -m 644 dictd_www.freedict.de_hun-eng.ifo       $pkgdir/usr/share/stardict/dic/
}

# vim:set ts=2 sw=2 et:

