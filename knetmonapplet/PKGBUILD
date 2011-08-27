# Contributor: Víctor Martínez Romanos <vmromanos@gmail.com>
# [Victor]
# Server = http://personales.ya.com/vmromanos/arch/pkgs
pkgname=knetmonapplet
pkgver=0.9
pkgrel=3
pkgdesc="KDE 3 kicker applet for monitoring network interfaces activity"
depends=('kdelibs')
groups=('kde')
url="http://hftom.free.fr/knetmonapplet/"
license=("GPL")
arch=('i686')
source=(http://hftom.free.fr/knetmonapplet/$pkgname-$pkgver.tar.gz)
md5sums=('7de78b8c1e22060d73f1e49222a6dab2')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=$startdir/pkg install
}
