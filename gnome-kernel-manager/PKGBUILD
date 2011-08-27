# Contributor: sickhate <vivid@tux-linux.net>
pkgname=gnome-kernel-manager
pkgver=0.0.1
pkgrel=1
pkgdesc="A tool for managing kernel modules and more."
arch=('i686')
url="http://osp.ir/projects/gkm/"
license=('GPL')
depends=('gtk2' 'gtkmm' 'libgnomeuimm' 'gnome-vfsmm')
source=('http://osp.ir/frs/download.php/54/gnome-kernel-manager-0.0.1.tar.gz')
md5sums=('a0b01c147118f904ef30eb89dcec046c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
