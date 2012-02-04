# Contributor: <fedor@yu.wildpark.net>

pkgname=lld2d
pkgver=1.0
pkgrel=2
pkgdesc="Link Layer Topology Discovery Daemon"
arch=(i686 x86_64)
url="http://www.microsoft.com/whdc/DevTools/WDK/WDKpkg.mspx"
license=('unknown')
source=(http://download.microsoft.com/download/b/8/e/b8eee444-f8d5-4b8b-aa3d-2f19bf19ac72/Rally-LLTD-PortingKit.exe
    state.c.patch
    lld2d
    lld2d.confd
)
noextract=()
md5sums=() #generate with 'makepkg -g'

build() {
  cd "$srcdir"
  unzip -f Rally-LLTD-PortingKit.exe
  cd "Sample Code"
  patch -Np0 < $srcdir/state.c.patch

  cd native-linux
    
  make || return 1

  install -D lld2d $pkgdir/usr/sbin/lld2d
  install -D lld2test $pkgdir/usr/bin/lld2test
  cd ../src
  install -D -m644 lld2d.conf $pkgdir/etc/lld2d.conf
  mkdir -p $pkgdir/usr/share/lld2d/
  install -D -m644 *.ico $pkgdir/usr/share/lld2d/
  install -D $srcdir/lld2d $pkgdir/etc/rc.d/lld2d
  install -D -m644 $srcdir/lld2d.confd $pkgdir/etc/conf.d/lld2d
}

md5sums=('883531bd38d1108311f7383dd41c0b99'
         'b381cffe03802a04014f1abe33e93bb7'
         '542e371e249a78575c8b99ee5555e679'
         '0d3b98b20396ba79ffecacc4abd56513')
