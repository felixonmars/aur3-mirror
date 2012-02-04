# Contributor: Nathan Owe. <ndowens.aur at gmail dot com>
pkgname=vs4p
pkgver=0.05
pkgrel=2
pkgdesc="A set of scripts that encode video for portable devices"
arch=('i686' 'x86_64')
url="http://code.google.com/p/vs4p/"
license=('MIT')
depends=('bash' 'python')
source=("http://vs4p.googlecode.com/files/$pkgname-$pkgver.tgz")
md5sums=('c67be6d1e37534c82df9a0d7b1eadd1c')

build() {
  
  /bin/true
}

package() {

  cd $srcdir/$pkgname-$pkgver

  install -d $pkgdir/usr/{share/$pkgname,bin}
  
  install -Dm644 * $pkgdir/usr/share/$pkgname/

  install -Dm755 $pkgdir/usr/share/$pkgname/dvd-to-iphone.sh $pkgdir/usr/bin/dvd-to-iphone

  install -Dm755 $pkgdir/usr/share/$pkgname/dvd-to-psp.sh $pkgdir/usr/bin/dvd-to-psp

  install -Dm755 $pkgdir/usr/share/$pkgname/tv-to-iphone.sh $pkgdir/usr/bin/tv-to-iphone

  install -Dm755 $pkgdir/usr/share/$pkgname/tv-to-psp.sh $pkgdir/usr/bin/tv-to-psp

  install -Dm755 $pkgdir/usr/share/$pkgname/video-to-iphone.sh $pkgdir/usr/bin/video-to-iphone

  install -Dm755 $pkgdir/usr/share/$pkgname/xvid-to-psp.sh $pkgdir/usr/bin/xvid-to-psp

  }

# vim:set ts=2 sw=2 et:
