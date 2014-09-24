# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=redo
pkgver=1.0
pkgrel=1
pkgdesc="An implementation of Bernstein's redo proposal"
arch=('i686' 'x86_64')
makedepends=('gcc')
url="http://homepage.ntlworld.com/jonathan.deboynepollard/Softwares/redo.html"
license=('custom:ISC')
source=(http://homepage.ntlworld.com/jonathan.deboynepollard/Softwares/redo.tar.bz2
        tools.patch)
sha256sums=('efc1035818795b7c26efaa2a0b19454c3a6f9ca3d7568b3b10686a757bb6b600'
            'e1c1688d44f3e874f8569fabdbe8ddba80ae6e52f62383960ba95181a04a594a')

prepare() {
  cd "$srcdir/$pkgname"

  msg 'Fixing compile tools...'
  patch -p1 < "$srcdir/tools.patch"

  msg 'Fixing export utility...'
  sed -i "s@man/man1@share/man/man1@g" package/export
}

build() {
  cd "$srcdir/$pkgname"

  msg 'Building...'
  ./package/compile
}

package() {
  cd "$srcdir/$pkgname"

  msg 'Installing license...'
  install -Dm 644 source/COPYING "$pkgdir/usr/share/licenses/redo/COPYING"

  msg 'Installing...'
  ./package/export "$pkgdir/usr/"
}
