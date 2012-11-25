_pkgbase=pygobject
pkgname=python32-gobject
pkgver=3.4.2
pkgrel=1
pkgdesc="Python 3.2 bindings for GObject"
arch=('i686' 'x86_64')
url="https://live.gnome.org/PyGObject"
license=('LGPL')
makedepends=('python' 'python-cairo' 'gobject-introspection')
depends=('gobject-introspection' 'python-cairo' "pygobject-devel=$pkgver")
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgbase/${pkgver::3}/$_pkgbase-$pkgver.tar.xz)
options=('!libtool')
sha256sums=('2b87ef3170be3a20a53fbdb348ae4ecb41a72a17ec6531baa67147c3437d2aad')

build() {
  cd "$_pkgbase-$pkgver"
  PYTHON=python3.2 ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgbase-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,lib/pkgconfig}  # These are in pygobject-devel
}
