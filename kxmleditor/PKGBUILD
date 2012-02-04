# Contributor: Víctor Martínez Romanos <vmromanos@gmail.com>
# [Victor]
# Server = http://personales.ya.com/vmromanos/arch/pkgs
pkgname=kxmleditor
pkgver=1.1.4
pkgrel=2
pkgdesc="XML editor for KDE"
depends=('kdelibs')
groups=('kde')
url="http://$pkgname.sourceforge.net"
license=("GPL")
arch=('i686' 'x86_64')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d2329e06393c78f22531b8ba42e67d9b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=$startdir/pkg install
}
