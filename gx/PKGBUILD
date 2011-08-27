# Contributor: rabyte <rabyte__gmail>

pkgname=gx
pkgver=0.4.0
pkgrel=3
pkgdesc="A lightweight GTK+ image viewer"
arch=('i686')
url="http://perticone.homelinux.net/~sergio/c++/gx/"
license=('custom:"gx"')
depends=('gtkmm>=2.10' 'gnome-vfsmm>=2.18' 'gconfmm>=2.16')
makedepends=('pkgconfig')
source=(http://perticone.homelinux.net/~sergio/c++/gx/src/gx-$pkgver.tar.gz)
md5sums=('4aacbf154469a19cda1c29cfa6338082')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -m644 -D COPYING $startdir/pkg/usr/share/licenses/gx/COPYING
  cd $startdir/pkg/usr/share
  install -m644 -D app-install/desktop/gx.desktop applications/gx.desktop

  # remove junk
  rm -rf app-install/
}
