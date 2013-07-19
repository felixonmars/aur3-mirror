# Contributor: willemw <willemw12@gmail.com>
# Contributor: Vincent Berset <msieurhappy@gmail.com>

pkgname=videomanager
pkgver=0.5
pkgrel=5
pkgdesc="GTK movie collection manager"
arch=('any')
url="http://codingteam.net/project/videomanager"
license="GPL"
depends=('pygtk' 'python2-pysqlite-legacy')
source=(http://codingteam.net/project/$pkgname/download/file/$pkgname-$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('234fa27cb842da9bdd52637b63703cbe' \
         'b1b5230c26874e59c20e2f5b8aa2bd6c')

package() {
  install -D -m644 videomanager.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  cd $pkgname-$pkgver

  mkdir -p -m755 "$pkgdir/usr/share/$pkgname"
  cp -R * "$pkgdir/usr/share/$pkgname"
  chmod -R 644 "$pkgdir/usr/share/$pkgname/"*
  chmod 755 "$pkgdir/usr/share/$pkgname/lang"
  
  mkdir -p -m755 "$pkgdir/usr/bin"
  echo "#!/bin/sh" > "$pkgdir/usr/bin/$pkgname"
  echo "python2 /usr/share/$pkgname/VideoManager.py" >> "$pkgdir/usr/bin/$pkgname"
  chmod 755 "$pkgdir/usr/bin/$pkgname"
  
  install -D -m644 vm.png "$pkgdir/usr/share/pixmaps/vm.png"
}
