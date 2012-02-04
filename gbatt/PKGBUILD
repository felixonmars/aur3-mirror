# Contributor: rpj8 (Factory) <semidigerati@gmail.com>

pkgname=gbatt
pkgver=1.3
pkgrel=3
pkgdesc="A laptop battery status indicator written in python"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gtk-tray-utils/"
license=('GPL')
groups=('gtk-tray-utils')
depends=('config' 'acpi' 'python' 'pygtk' 'gnome-python-extras')
makedepends=()
install=
source=(http://gtk-tray-utils.googlecode.com/svn/trunk/$pkgname-$pkgver.tar.gz)
md5sums=('7be0b243b2045857598878d7d793c123')

build() {
  mkdir -p $startdir/pkg/usr/{bin,share/{gbatt,pixmaps/gbatt}}
  cd $startdir/src/$pkgname-$pkgver
  cp gbatt.py $startdir/pkg/usr/share/gbatt/
  cp gbatt $startdir/pkg/usr/bin/
  cp -r gbatt_about $startdir/pkg/usr/share/gbatt/
  cp -r gbatt_warning $startdir/pkg/usr/share/gbatt/
  cp pixmaps/* $startdir/pkg/usr/share/pixmaps/gbatt/
}
