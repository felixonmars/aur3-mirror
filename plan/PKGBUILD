# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=plan
pkgver=1.10.1
pkgrel=1
pkgdesc="Calendar and Day Planner based on Motif"
arch=('x86_64')
url="http://www.bitrot.de/plan.html"
license=('GPL')
depends=('xorg-server' 'lesstif' )
source=(ftp://ftp.fu-berlin.de/unix/X11/apps/plan/plan-1.10.1.tar.gz)
md5sums=('0de80b5074ca77b20801ed689e82a5a8')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  echo 4 | ./configure 
  make linux64 || return 1
  make prefix=$pkgdir/usr install
  }
