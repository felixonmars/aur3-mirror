pkgname=blockdude
pkgver=1.0
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="A challenging puzzle game. The goal is to reach the door of each level."
url="http://blockdude.tuxfamily.org/"
license=('GPL')
depends=('python2' 'python2-pygame')
source=(http://blockdude.tuxfamily.org/blockDude.tar.bz2)
md5sums=('982f22951243e99bb67235e49a0cfab1')

package() {
  cd $srcdir/
  install -d $pkgdir/usr/share/blockdude
  install -d $pkgdir/usr/bin
  cp -dpr --no-preserve=ownership $srcdir/blockDude/* $pkgdir/usr/share/blockdude
cat > $pkgdir/usr/bin/blockdude <<EOF
#!/usr/bin/env bash
(pushd /usr/share/blockdude &> /dev/null
python2 blockDude.py)
EOF
  chmod +x $pkgdir/usr/bin/blockdude
}
