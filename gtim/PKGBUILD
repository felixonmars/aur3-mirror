# Contributor: no4 <matej.horvath@gmail.com>
# Maintainer: rpj8 (Factory) <semidigerati@gmail.com>

pkgname=gtim
pkgver=1.2
pkgrel=3
pkgdesc="a clock in the system tray"
url="http://code.google.com/p/gtk-tray-utils/"
license="GPL"
depends=('python' 'pygtk' 'libglade' 'gnome-python-extras' 'config')
source=(http://gtk-tray-utils.googlecode.com/svn/trunk/gtim-$pkgver.tar.gz)
arch=('i686')
md5sums=('a5f1ad03782b3fdc032784c229893c63')

build() {
  mkdir -p $startdir/pkg/usr/{bin,share/gtim}
  cd $startdir/src/$pkgname-$pkgver
  cp gtim $startdir/pkg/usr/bin/
  cp gtim.py $startdir/pkg/usr/share/gtim/
  cp -r gtim_about $startdir/pkg/usr/share/gtim/gtim_about
}
