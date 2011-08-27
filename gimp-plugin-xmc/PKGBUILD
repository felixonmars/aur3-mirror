# Contributor: the_shade <theshade14@gmail.com>
pkgname=gimp-plugin-xmc
pkgver=2.0.6
pkgrel=1
pkgdesc="GIMP plugin to import and export X11 mouse cursor."
arch=('i686' 'x86_64')
url="http://gimpstuff.org/content/show.php/X11+Mouse+Cursor+%28XMC%29+plug-in?content=94503"
license=('GPLv3')
depends=('gimp>=2.6' 'libxcursor')
source=(http://gimpstuff.org/CONTENT/content-files/94503-gimp-xmc-plugin-2.0.6.tar.gz)
md5sums=('aff3c5adf1566b036b3aad8936e1ec6b')

build() {
  cd $startdir/src/gimp-xmc-plugin-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install
}
