# Maintainer: Laszlo Papp <djszapi@archlinux.us>

pkgname=stardict-fin
pkgver=2.4.2
pkgrel=1
pkgdesc="English Finnish dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(
    http://downloads.sourceforge.net/xdxf/stardict-comn_sdict05_eng_fin-$pkgver.tar.bz2
    http://downloads.sourceforge.net/xdxf/stardict-comn_sdict05_fin_eng-$pkgver.tar.bz2
    )
md5sums=('fb91a3d7587fcf0838e263f084dacc15'
         'e55f1fcaaee5e0126fa8d71ecae005fb')

build() {
    cd $srcdir/stardict-eng_fin-$pkgver
        mkdir -p $pkgdir/usr/share/stardict/dic/
        install -m 644 eng_fin.dict.dz   $pkgdir/usr/share/stardict/dic/
        install -m 644 eng_fin.idx       $pkgdir/usr/share/stardict/dic/
        install -m 644 eng_fin.ifo       $pkgdir/usr/share/stardict/dic/

        cd $srcdir/stardict-fin_eng-$pkgver
        mkdir -p $pkgdir/usr/share/stardict/dic/
        install -m 644 fin_eng.dict.dz   $pkgdir/usr/share/stardict/dic/
        install -m 644 fin_eng.idx       $pkgdir/usr/share/stardict/dic/
        install -m 644 fin_eng.ifo       $pkgdir/usr/share/stardict/dic/
}

# vim:set ts=2 sw=2 et:

