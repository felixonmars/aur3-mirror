# Maintainer: Edward Tjörnhammar <xhemi@cube2.se>
# Contributor: Edward Tjörnhammar <xhemi@cube2.se>
# Additional contributor: Christoph Neuroth <delmonico@gmx.net>
# Additional contributor: Marcus Hermansson <mashnu@gmail.com> 

pkgname=ccxstream
pkgver=1.0.15
pkgrel=3
pkgdesc="XBMSP server by PuhPuh"
arch=('i686' 'x86_64')
url="https://sourceforge.net/project/shownotes.php?release_id=191191&group_id=87054"
source=("http://heanet.dl.sourceforge.net/sourceforge/xbmc/$pkgname-$pkgver.tar.gz")
license=('unknown')
depends=('termcap-compat')
md5sums=('c589fff48ce541f26b394c9d82ccbead')

build() {
  _S=$startdir/src/$pkgname-$pkgver
  _D=$startdir/pkg
  pushd $_S
  make ccxstream || return 1
  mkdir -p $_D/{usr,etc} || return 1
  mkdir -p $_D/etc/{conf.d,rc.d} || return 1
  mkdir -p $_D/usr/bin || return 1
  
  install -m0755 ccxstream $_D/usr/bin/. || return 1
  popd
  install -m0644 $startdir/$pkgname.cf $_D/etc/conf.d/ccxstream || return 1
  install -m0775 $startdir/$pkgname.rc $_D/etc/rc.d/ccxstream || return 1
  
}
