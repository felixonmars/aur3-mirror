# Maintainer: Sean Yeh <snoblo at archlinux dot us>

pkgname=bash2
pkgver=2.0.5b
pkgrel=1
pkgdesc="The GNU Bourne Again shell. Version 2.05b."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/bash/bash.html"
depends=('readline' 'glibc')
source=("http://ftp.gnu.org/gnu/bash/bash-2.05b.tar.gz")
md5sums=("5238251b4926d778dfe162f6ce729733")

build() {
  cd "$srcdir/bash-2.05b"
  ./configure --prefix=/usr --with-curses --enable-readline \
    --without-bash-malloc --with-installed-readline
  make
}

package() {
  install -Dm755 "$srcdir/bash-2.05b/bash" "$pkgdir/bin/bash2"
  install -Dm755 "$srcdir/bash-2.05b/doc/bash.1" "$pkgdir/usr/share/man/man1/bash2.1"
}

