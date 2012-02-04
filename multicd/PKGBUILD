# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=multicd
pkgver=1.7.5
pkgrel=1
pkgdesc="Tool for making direct copies of your files to multiple cd's"
arch=('i686' 'x86-64')
url="http://danborn.net/multicd/"
license=('GPL')
depends=('perl>=5')
source=(http://danborn.net/multicd/$pkgname-$pkgver.tar.gz)
md5sums=('b27bf5d4514a5d8948de3f037a475d0b') 

build() {
  cd $srcdir/$pkgname-$pkgver
install -d $pkgdir/usr/bin $pkgdir/usr/bin $pkgdir/etc/ $pkgdir/usr/share/$pkgname/bin
install -m644 COPYING LICENSE $pkgdir/usr/share/$pkgname
install -m755 multicd $pkgdir/usr/bin/multicd
install -m644 sample_multicdrc $pkgdir/etc/multicdrc

 
}

# vim:set ts=2 sw=2 et:
