# Contributor: catwell <catwell@archlinux.us>

pkgname=gfaim
pkgver=0.30
pkgrel=5
pkgdesc="Software to search recipes, in french."
arch=('i686' 'x86_64')
url="http://freeperso.free.fr/gfaim.html"
license=('GPL')
depends=('gtk')
install=gfaim.install
source=(http://freeperso.free.fr/$pkgname-$pkgver.tar.gz LICENSE.txt)
md5sums=(370819d64c79f5be7aa1465d4578e17a cb0662786c3483b8d75240a7630aebd9)

build()
{
  cd $srcdir/$pkgname-$pkgver
  make clean || return 1
  sed -i 's/(int \*)\( loc\)/\1/' gfaim.c
  sed -i 's/(int \*)\( position\)/\1/' gfaim.c
  make DATADIR=/usr/share/gfaim || return 1
  install -D -m0755 gfaim $pkgdir/usr/bin/gfaim
  install -m0755 imprec $pkgdir/usr/bin/imprec
  install -d $pkgdir/usr/share/gfaim
  install -m0644 *.dat *.idx $pkgdir/usr/share/gfaim
  install -D -m0644 $srcdir/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

