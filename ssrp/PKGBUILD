# Maintainer: Marcin Skory <armitage at q84fh dot net>
pkgname=ssrp
pkgver=20120327
pkgrel=1
pkgdesc="A region patcher for Sega Saturn disc images"
arch=('i686' 'x86_64' 'arm')
url="http://www.romhacking.net/utilities/861/"
license=('GPL')
source=(http://dl.dropbox.com/u/66380412/aur/src/ssrp/$pkgname-$pkgver.tar.xz)
md5sums=('c3d5bed3ecf0d51db0fdb28b89862d47')
sha1sums=('e90db5a4f1179065e19628da696602179b12f8c3')
sha256sums=('a5494152e39337b07056b883c18fab35e0d001a554e23d3198e8d1b5086aa9b1')
sha384sums=('e9ee4578446c19f0e2f2060023d8aab487497469afea68c0b7c7b60b8c2320cb5a0ca17efdf65f93ce3b8fe5588fd44f')
sha512sums=('e1b76fec487c2f694d34756d0f772a41bbda4b82fa71769a1f2bca4a6101a5b65d1c3e9849f29c40b0968688dd95bba0c12d9635a04ec2eecf5c814c330e207b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gcc -o ssrp ssrp.c
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin/
  install -m755 ssrp $pkgdir/usr/bin/ssrp
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -m644 readme.txt $pkgdir/usr/share/doc/$pkgname/README
}

# vim:set ts=2 sw=2 et:
