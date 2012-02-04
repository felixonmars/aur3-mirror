# Maintainer: Igor Dejanovic igor.dejanovic AT gmail DOT com

pkgname=stardict-gcide
pkgver=2.4.2
pkgrel=1
pkgdesc="The Collaborative International Dictionary of English for Stardict"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"

source=(http://yeelou.com/huzheng/stardict-dic/dict.org/stardict-dictd_www.dict.org_gcide-2.4.2.tar.bz2)
arch=('i686' 'x86_64')

build() {
        mkdir -p $pkgdir/usr/share/stardict/dic/
        cd $srcdir/stardict-dictd_www.dict.org_gcide-$pkgver
        install -m 644 dictd_www.dict.org_gcide.dict.dz $pkgdir/usr/share/stardict/dic/
        install -m 644 dictd_www.dict.org_gcide.idx $pkgdir/usr/share/stardict/dic/
        install -m 644 dictd_www.dict.org_gcide.ifo $pkgdir/usr/share/stardict/dic/
  
}


md5sums=('c9cc5fa5a35597ed347956b39f3f7597')
