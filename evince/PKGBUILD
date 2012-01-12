# gtk2 version evince, without gconf, dconf and documentation
# contributor: hadzhimurad ustarkhan - hmurad dot ust at gmail dot com

pkgname=evince-gtk2
pkgbase=evince
pkgver=2.32.0
pkgrel=2
pkgdesc="Simple document viewer (GTK2 version)"
arch=('i686' 'x86_64')
url="http://projects.gnome.org/evince/"
license=('GPL')
depends=('gtk2' 'poppler-glib' 'libspectre' 'djvulibre' 't1lib' 'gsfonts' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('intltool')
provides=('evince')
conflicts=('evince')
options=('!libtool')
install=evince-gtk2.install
source=("http://ftp.gnome.org/pub/gnome/sources/$pkgbase/2.32/$pkgbase-$pkgver.tar.bz2"
        "patches.tar")

md5sums=('ebc3ce6df8dcbf29cb9492f8dd031319'
         'dc9196e714c9087132a45b449224ca25')

build() {
  cd $srcdir/$pkgbase-$pkgver

  patch -Np1 -i "$srcdir/libdocument-segfault.patch"
  patch -Np1 -i "$srcdir/libview-crash.patch"
  patch -Np1 -i "$srcdir/panmode.patch"
  patch -Np1 -i "$srcdir/stop-spinner.patch"
  patch -Np1 -i "$srcdir/use-popup.patch"

  # Don't depend on gnome-icon-theme
  sed -i '/gnome-icon-theme/d' configure

  ./configure --prefix=/usr --libexecdir=/usr/lib/evince \
    --disable-static --disable-dbus \
    --disable-schemas-compile --disable-schemas-install \
    --disable-tests --disable-nautilus --disable-thumbnailer \
    --disable-previewer --disable-scrollkeeper --disable-help \
    --enable-t1lib --enable-pixbuf --enable-impress \
    --without-keyring --without-gconf
  make
}

package() {
    cd $srcdir/$pkgbase-$pkgver

    make DESTDIR="$pkgdir" install

    rm -rf ${pkgdir}/usr/share/gtk-doc
    rm -rf ${pkgdir}/usr/share/GConf
}
