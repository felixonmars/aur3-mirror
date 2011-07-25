# Maintainer : SpepS < dreamspepser at yahoo dot it >
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth.aur@gmail.com>

_p=compiz
_pkg=$_p-decorator-gtk
pkgname=$_pkg-no-gnome
pkgver=0.8.8
pkgrel=1
pkgdesc="Decorator of Compiz for GNOME"
url="http://www.go-compiz.org/"
license=('GPL2' 'LGPL2.1' 'MIT')
arch=('i686' 'x86_64')
depends=('compiz-core' 'metacity>=2.28')
makedepends=('intltool>=0.23')
groups=("$_p")
options=('!libtool' '!emptydirs')
conflicts=('compiz-git' "$_pkg-git" "$_pkg")
provides=("$_pkg")
source=("http://releases.$_p.org/$pkgver/$_p-$pkgver.tar.gz")
install="$_pkg.install"
md5sums=('d7e96f839b7cb0901470d5da04be4db2')

build() {
  cd "$srcdir/$_p-$pkgver"
  
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-librsvg \
              --enable-metacity \
              --enable-gtk \
              --enable-gconf \
              --enable-dbus \
              --disable-kde \
              --disable-gnome \
              --with-gconf-schema-file-dir=/etc/gconf/schemas
  make
}

package() {
  cd "$srcdir/$_p-$pkgver"

  pushd gtk
  make DESTDIR="$pkgdir/" install

  # schemas
  install -Dm644 window-decorator/gwd.schemas \
                "$pkgdir/usr/share/gconf/schemas/gwd.schemas"
  popd

  pushd metadata
  for i in dbus gconf ini inotify png regex svg glib kconfig
  do
    [ -f $_p-$i ] && rm $_p-$i.schemas
  done

  gconf-merge-schema \
    "$pkgdir/usr/share/gconf/schemas/$_pkg.schemas" *.schemas
  popd

  rm -rf "$pkgdir/etc"

  # install MIT license
  install -Dm644 COPYING.MIT \
    "$pkgdir/usr/share/licenses/$_pkg/COPYING.MIT"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/licenses/$_pkg/COPYING.MIT \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
