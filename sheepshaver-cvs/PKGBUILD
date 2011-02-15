## Maintainter: Milos Pejovic <pejovic@gmail.com>
pkgname=sheepshaver-cvs
pkgver=20110215
pkgrel=1
pkgdesc="An Open Source PowerPC MacOS run-time environment"
arch=('i686' 'x86_64')
url="http://sheepshaver.cebix.net/"
license="GPL"
depends=('gtk2' 'sdl')
makedepends=('cvs' 'expect' 'autoconf')
conflicts=('sheepshaver')
provides=('sheepshaver')
source=(http://sheepshaver.cebix.net/images/sheep.png
        SheepShaver.desktop)
md5sums=('694e1efa81d9faf6dbd514938340c260'
         '8fb9c2cce0c0b35fecc27b169db0514d')

_cvsroot=":pserver:anoncvs@cvs.cebix.net:/home/cvs/cebix"

build() {
  cd "$srcdir"
  
  msg "Connecting to CVS server...."
  expect -c "spawn cvs -d $_cvsroot login" -c 'expect "CVS password:"' -c 'send "anoncvs\r"' -c 'expect eof'

  for _cvsmod in BasiliskII SheepShaver; do
    if [ -d $_cvsmod/CVS ]; then
      cd $_cvsmod
      cvs -z3 update -d
      cd ..
    else
      cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    fi
  done
  
  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  cd SheepShaver
  make links
  
  cd src/Unix
  ./autogen.sh --prefix=/usr --enable-sdl-audio --without-esd
  mkdir obj
  make
}

package() {
  cd "$srcdir/SheepShaver/src/Unix"
  make DESTDIR="$pkgdir/" install
  
  install -m644 "$srcdir/sheep.png" "$pkgdir/usr/share/SheepShaver"
  
  install -D -m644 "$srcdir/SheepShaver.desktop" "$pkgdir/usr/share/applications/SheepShaver.desktop"
  
  install -d -m 755 "$pkgdir/usr/share/doc/SheepShaver"
  cd "$srcdir/SheepShaver/doc/Linux"
  install -m644 *.html *.gif "$pkgdir/usr/share/doc/SheepShaver"
}

