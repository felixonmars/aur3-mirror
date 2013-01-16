# Maintainer: TDY <tdy@archlinux.info>

pkgname=rtfreader
pkgver=1
pkgrel=1
pkgdesc="A portable application/ms-rtf parser"
arch=('i686' 'x86_64')
url="http://www.fiction.net/blong/programs/#rtf"
license=('GPL')
depends=('glibc')
source=(http://www.fiction.net/blong/programs/ms-rtf.tar.gz
        $pkgname-hex.diff)
md5sums=('fa203d863ec479b36bcbed3abdd4e77e'
         '2a08f69047adbb622254fd395c697f05')

build() {
  cd "$srcdir/ms-rtf"
  patch -Np0 -i ../$pkgname-hex.diff
  make CFLAGS="$CFLAGS"
}

package() {
  cd "$srcdir/ms-rtf"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
