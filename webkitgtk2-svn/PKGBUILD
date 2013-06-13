# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=webkitgtk2-svn
pkgver=151539
pkgrel=5
pkgdesc="GTK+ Web content engine library for GTK+ 2.0"
arch=('i686' 'x86_64')
url="http://webkitgtk.org/"
license=('custom')
depends=('libxt' 'libxslt' 'sqlite' 'libsoup' 'enchant' 'libgl' 'geoclue' 'gtk2' 'gstreamer0.10-base' 'libwebp')
makedepends=('subversion' 'libxt' 'libxslt' 'sqlite' 'libsoup' 'enchant' 'libgl' 'geoclue' 'gtk2' 'gstreamer0.10-base' 'gperf' 'gobject-introspection' 'mesa' 'ruby' 'gtk-doc' 'libsecret' 'python' 'pango')
conflicts=('libwebkit')
provides=("libwebkit=${pkgver}")
replaces=('libwebkit')
options=('!libtool' '!emptydirs')
source=('webkitgtk2::svn+https://svn.webkit.org/repository/webkit/trunk')
md5sums=('SKIP')
_svnmod="webkitgtk2"

pkgver() {
  cd $SRCDEST/webkitgtk2
  svnversion
}

build() {
  cd "$srcdir/webkitgtk2"
  ./autogen.sh
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/webkitgtk2 \
    --with-gtk=2.0 \
    --disable-webkit2

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make 
  # ./Tools/Scripts/update-webkit 
  # ./Tools/Scripts/build-webkit --gtk3
}

package() {
  cd "$srcdir/webkitgtk2"
  make -j1 DESTDIR="$pkgdir/" install
  install -Dm644 Source/WebKit/LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
