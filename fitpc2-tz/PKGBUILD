# Maintainer: William Díaz <wdiaz [at] archlinux [dot] us>
## Maintainer: Alexandr Kotov nektokot at gmail dot com

pkgname=fitpc2-tz
pkgver=20101010
pkgrel=1
pkgdesc="Fitpc2 thermal sensor kernel module"
arch=('i686' 'x86_64')
url="http://github.com/patjak/fitpc2_tz"
license=('GPL')
depends=('')
makedepens=('git' 'kernel26-headers')
install=fitpc2-tz.install
source=()
md5sums=('15890e1f9afe844adf2e251d390e28ac')

_gitroot="git://github.com/patjak/fitpc2_tz.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin 
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver 
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  make 

  install -D -m 755 fitpc2_tz.ko ${pkgdir}/lib/modules/$(uname -r)/updates/fitpc2_tz.ko 
}
