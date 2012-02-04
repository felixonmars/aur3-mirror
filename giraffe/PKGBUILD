# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=giraffe
pkgver=1.0
pkgrel=1
pkgdesc="A simple logic circuit simulator written in Java."
arch=(any)
url="http://nbenoit.tuxfamily.org/index.php?page=Giraffe"
license=('GPL')
depends=(java-runtime)
#install=$pkgname.install
source=(http://nbenoit.tuxfamily.org/projects/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8b4884dd2f634c8dd497286b3f9ba1ed')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d -m644 "$pkgdir/usr/share/$pkgname"
  cp -a {lib,gfx,class} "$pkgdir/usr/share/$pkgname/"

  sed 's|class|/usr/share/giraffe/class|' -i giraffe.sh
  install -Dm755 giraffe.sh "$pkgdir/usr/bin/giraffe"
  
  find $pkgdir -type d -exec chmod 755 {} \;
  find $pkgdir/usr/share/$pkgname -type f -exec chmod 644 {} \;
}

