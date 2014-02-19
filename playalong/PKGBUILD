#  Maintainer: Johannes Kulick <johannes -at- mailless.org>

pkgname=playalong
pkgver=20140218
pkgrel=1
pkgdesc="A simple, yet useful music player for musicians"
url="http://www.github.com/hildensia/playalong"
license=('GPL' )
arch=('i686' 'x86_64')
makedepends=('git')
depends=('ffmpeg' 'libao' 'ncurses')
source=("$pkgname::git+https://github.com/hildensia/playalong.git")
md5sums=('SKIP')

build() {
  cd $pkgname
  make
  
}

package() {
    cd $pkgname
    mkdir -p $pkgdir/usr/bin
    make DESTDIR="$pkgdir/usr" install
}

