# Contributor: Nassim Kacha <nassim.kacha@gmail.com> 
# Maintainer : Nassim Kacha <nassim.kacha@gmail.com> 
pkgname=conky-kde4-transparency
pkgver=0.1
pkgrel=2
pkgdesc="A very small script for Conky transparency with KDE4"
arch=('i686' 'x86_64')
url="http://www.linuxdz.net/?q=node/87"
license=('GPL2')
depends=('feh')
source=(http://download.tuxfamily.org/ldz/linux/archlinux/any/$pkgname-$pkgver.tar.gz)
md5sums=('8a2a4c5736e1f2d34961421651ef5961')

build() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/autostart
  cd $srcdir/$pkgname-$pkgver
  install -m 0755 $pkgname $pkgdir/usr/bin/$pkgname || return 1
  install -m 0644 $pkgname.desktop $pkgdir/usr/share/autostart/$pkgname.desktop || return 1
} 