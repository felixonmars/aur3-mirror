# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Angel Velasquez <angvp@archlinux.org>  
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

_pkg=lxappearance
pkgname=$_pkg-gtk2
pkgver=0.5.1
pkgrel=1
pkgdesc="GTK+ theme switcher of the LXDE Desktop (manages icons and fonts). Gtk2 version."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://lxde.org/"
groups=('lxde')
depends=('gtk2')
makedepends=('intltool')
source=("http://downloads.sourceforge.net/sourceforge/lxde/$_pkg-$pkgver.tar.gz")
md5sums=('34d157a7fe97ef0b93db8fab3f251e07')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  # replace any lxappearance with lxappearance_gtk2
  # for not conflict with lxappearance in [community]
  sed -i "s|$_pkg|&_gtk2|g;s|${_pkg^^}|&_GTK2|g" `grep -Erl "($_pkg|${_pkg^^})" .`
  for _f in `find . -name "*$_pkg*"`; do
    echo $_f
    mv $_f "$(echo $_f | sed "s|$_pkg|&_gtk2|g")"
  done

  ./configure --prefix=/usr \
                --sysconfdir=/etc
  make 
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  make DESTDIR="$pkgdir" install 
}
