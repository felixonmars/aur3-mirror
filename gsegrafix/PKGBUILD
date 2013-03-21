# Maintainer: Brandon Invergo <brandon@invergo.net>
pkgname=gsegrafix
pkgver=1.0.6
pkgrel=1
pkgdesc="A GNOME application for producing anti-aliased scientific and engineering plots"
arch=(i686 x86_64)
url="http://www.gnu.org/software/gsegrafix"
license=('GPL')
groups=()
depends=('gtk2' 'libgnomecanvas' 'libbonoboui' 'gconf' 'gnome-vfs' \
         'libgnome' 'libgnomeui' 'libgnomeprint' \
         'libgnomeprintui')
options=()
install=$pkgname.install
source=("http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"
        01_link-to-libm.diff)
md5sums=('59b159b528b408ff3b558922a2817397'
         '79748f32cf2a4910ae4923693bc377c3') 

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -uN src/Makefile.in ../01_link-to-libm.diff
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install

  install -m755 -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$pkgname.schemas" \
    "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -f "$pkgdir"/etc/gconf/schemas/*.schemas
}

# vim:set ts=2 sw=2 et:
