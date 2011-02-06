# Contributor: lp76 <l.peduto@gmail.com>
pkgname=gtk-theme-switch-ex
pkgver=2.0.0
pkgrel=2
pkgdesc="A small and fast program which allows you to preview and switch GTK themes"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gtk-theme-switch-ex/"
license=('GPL')
depends=('gtk2')
source=(http://gtk-theme-switch-ex.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('df3fcc6865c75003c18c8985cc567f3e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./waf --prefix=/usr configure
  ./waf
  ./waf --destdir=$startdir/pkg install
}
