# Maintainer: Fazlul Shahriar <fshahriar@gmail.com>
pkgname=abaco
pkgver=20081120
pkgrel=1
pkgdesc="A multi-page graphical web browser"
arch=('i686' 'x86_64')
url="http://lab-fgb.com/abaco/"
license=('custom')
depends=('glibc' 'plan9port')
makedepends=('plan9port')
source=("http://rain.ifmo.ru/~olegfink/$pkgname-p9p.tgz")
md5sums=('05af8ccc4ca335bdcced809bfd0a3aa1')

build() {
  source /etc/profile.d/plan9.sh

  cd "$srcdir/$pkgname"

  # fonts
  sed -i "s|/usr/local/plan9/font/lucsans/passwd.6.font|/usr/share/abaco/passwd.6.font|" abaco/main.c
  install -D abaco/passwd.6.font $pkgdir/usr/share/abaco/passwd.6.font
  sed -i "s|/usr/local/plan9|$PLAN9|g" abaco/*.[ch]

  9 mk || return 1
  install -D abaco/o.abaco $pkgdir/usr/bin/abaco.bin
  install -D abaco.sh $pkgdir/usr/bin/abaco
  install -D webfs/o.webfs $pkgdir/usr/bin/webfs
  install -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
