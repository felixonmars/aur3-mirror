pkgname=wbar_util
pkgver=1.0
pkgrel=1
pkgdesc="A large Configuration GUI for wbar written in Python and GTK"
arch=('i686' 'x86_64')
url="http://home.arcor.de/max.federle/wbarutil/index.html"
license=('GPL')
depends=('python' 'pygtk' 'pygobject' 'wbar')
source=(http://home.arcor.de/max.federle/wbarutil/downloads/$pkgname-$pkgver.tar.bz2)

build() {
  cd $startdir/src/$pkgname
  sh ./install.sh $startdir/pkg/usr || return 1
}

md5sums=('355e1eb9144381a02fd0e93f705f0f22')

