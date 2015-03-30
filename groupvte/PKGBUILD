# Contributor: William Rea <sillywilly@gmail.com>
pkgname=groupvte
pkgver=0.0.12
pkgrel=5
arch=('any')
pkgdesc="Small multitab terminal to administrate groups of similar machines very easily"
url="http://acksyn.org/software/groupvte/"
depends=('python2' 'vte' 'pygtk')
source=(http://acksyn.org/software/groupvte/download/$pkgname-$pkgver.tar.bz2)
md5sums=('e868b6e3f73e54870dbed14d5aefb544')
license=('GPL')
install=groupvte.install

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make 
  sed -i '1s+python+python2+' $srcdir/$pkgname-$pkgver/src/$pkgname
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  
  install -D -m755 doc/$pkgname.conf.example \
    $pkgdir/etc/$pkgname/$pkgname.conf.example
  install -D -m755 doc/$pkgname.1 \
    $pkgdir/etc/$pkgname/$pkgname.1 
  install -D -m755 doc/$pkgname.conf.5 \
    $pkgdir/etc/$pkgname/$pkgname.conf.5 
  rm $pkgdir/etc/$pkgname/$pkgname.1
  rm $pkgdir/etc/$pkgname/$pkgname.conf.5 
}
