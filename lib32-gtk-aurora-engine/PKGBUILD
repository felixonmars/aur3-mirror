# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkgbasename=gtk-aurora-engine
pkgname=lib32-$_pkgbasename
pkgver=1.5.1
pkgrel=2
pkgdesc="Gtk-engine: latest member of the clearlooks family. Multilib."
arch=('x86_64')
url="http://www.gnome-look.org/content/show.php/Aurora+Gtk+Engine?content=56438"
license=('GPL')
depends=('lib32-gtk2' "$_pkgbasename")
makedepends=('gcc-multilib' 'pkgconfig')
options=('!libtool')
source=("http://www.gnome-look.org/CONTENT/content-files/56438-aurora-${pkgver}.tar.bz2")
md5sums=('5eeea57c5938306ad7ccfc7cd71d009d')

build() {

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  tar xzf aurora-gtk-engine-1.5.tar.gz

  cd $srcdir/aurora-1.5

  ./configure --prefix=/usr \
	--libdir=/usr/lib32 \
	--enable-animation || return 1

  make || return 1
}

package() {

  cd $srcdir/aurora-1.5

  make DESTDIR=$pkgdir install
}