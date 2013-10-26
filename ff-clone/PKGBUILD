# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=ff-clone
pkgver=1.1
pkgrel=2
pkgdesc="Fish Fillets Clone"
arch=('i686' 'x86_64')
url="http://www.olsak.net/mirek/ff-clone/index_en.html"
license=('GPL2')
depends=('cairo' 'lua51')
source=(http://www.olsak.net/mirek/ff-clone/$pkgname-$pkgver.tgz
        ff-clone.desktop)
md5sums=('a6b1e9902572e80ed2a13340f416c4cb'
         'e5f2bc21fb7a675b15da2f7393aeffbd')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # Fix Install dirs
  sed -i 's_local/bin_share/ff-clone_' Makefile
  sed -i 's_local/share_share_' Makefile

  # Use lua5.1 and add -lm
  sed -i 's_pkg-config --cflags lua 2>/dev/null ||__' Makefile   
  sed -i 's_$(shell pkg-config --libs lua 2>/dev/null || pkg-config --libs lua5.1 2>/dev/null || echo -llua)_-llua5.1 -lm_' Makefile 
}
  
build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  # Data
  install -Dm755 $pkgname $pkgdir/usr/share/$pkgname/$pkgname
  cp -r data/* $pkgdir/usr/share/$pkgname

  # Executable in path
  mkdir -p $pkgdir/usr/bin
  ln -s  "/usr/share/ff-clone/ff-clone" "$pkgdir/usr/bin/ff-clone"

  # Desktop icon
  install -Dm644 data/gimages/big.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}