# Maintainer:  Alucryd <alucryd at gmail dot com>
# Contributor: TDY <tdy at gmx dot com>
pkgname=wxgtk-2.9
pkgver=2.9.3
pkgrel=2
pkgdesc="A GTK+ implementation of wxWidgets API for GUI"
arch=('i686' 'x86_64')
url="http://wxwidgets.org/"
license=('custom:wxWindows')
depends=('mesa' 'libxpm' 'gstreamer0.10-good-plugins' 'libgnomeprintui' 'cppunit' 'libxxf86vm')
source=(http://downloads.sourceforge.net/wxwindows/wxWidgets-$pkgver.tar.bz2)
md5sums=('6b6003713289ea4d3cd9b49c5db5b721')
 
build() {
  cd "$srcdir/wxWidgets-$pkgver"
  sed -i 's,/usr/$wx_cv_std_libpath,& /usr/lib,' configure
  ./configure --prefix=/usr --libdir=/usr/lib --with-gtk=2 --with-opengl --with-gnomeprint --enable-graphics_ctx --enable-mediactrl --disable-optimise --disable-compat28
  make
  make -C locale allmo
}
 
package() {
  cd "$srcdir/wxWidgets-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 docs/licence.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 
  # provide compatibility with extra/wxgtk
  ln -sf /usr/lib/wx/config/gtk2-unicode-2.9 "$pkgdir/usr/bin/wx-config-2.9"
  rm -f "$pkgdir/usr/bin/wx-config"
  rm -f "$pkgdir/usr/bin/wxrc"
  rm -rf "$pkgdir/usr/share/bakefile"
  find "$pkgdir/usr/share/locale" -name wxmsw.mo -delete
  for _mo in "$pkgdir"/usr/share/locale/*/LC_MESSAGES/wxstd.mo; do
    mv $_mo ${_mo/wxstd.mo/compat-wxstd29.mo}
  done
  mv "$pkgdir/usr/share/aclocal/wxwin.m4" "$pkgdir/usr/share/aclocal/wxwin-2.9.m4"
}
