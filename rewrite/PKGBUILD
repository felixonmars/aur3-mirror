# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=rewrite
pkgver=1.0
pkgrel=3
pkgdesc="Reads a file, feeding its contents thru a pipe/shell command, read it and write back to the file"
arch=('i686' 'x86_64')
url="http://oss.ezic.com/"
license=('GPL')
depends=('glibc')
source=(http://oss.ezic.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('06eb02ebe78c545b4bd6ea13fadaa43a')

build() {
  cd "$srcdir/$pkgname"

  make || return 1

  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/doc/$pkgname

  install -m 755 $pkgname $pkgdir/usr/bin/
  install -m 644 README $pkgdir/usr/share/doc/$pkgname/
}

# vim:set ts=2 sw=2 et:
