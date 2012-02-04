# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=topbt
pkgver=1.5
pkgrel=1
pkgdesc="java bittorrent client"
arch=('i686' 'x86_64')
url="http://topbt.cse.ohio-state.edu/"
license=('gpl')
depends=('java-runtime' 'bash')
source=(http://downloads.sourceforge.net/top-bt/TopBT-v1.5-linux-x86.zip)
md5sums=('70205f6cf2fa57e6bb032ccef68b9834') 

build() {
  cd $srcdir/topbt-linux-x86
install -d $pkgdir/usr/share/java/$pkgname $pkgdir/usr/bin || return 1
install $srcdir/topbt-linux-x86/TopBT.jar $pkgdir/usr/share/java/$pkgname/topbt.jar || return1
install $srcdir/topbt-linux-x86/swt.jar $pkgdir/usr/share/java/$pkgname || return 1
install $startdir/topbt.sh $pkgdir/usr/bin/topbt || return 1
}

# vim:set ts=2 sw=2 et:
