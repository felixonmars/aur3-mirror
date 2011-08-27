# Submitter:  Brad Arrington <bradla8@yahoo.com>
# Maintainer:  Brad Arrington <bradla8@yahoo.com>

pkgbase="glib2-systemtap"
pkgname=glib2-systemtap
pkgver=2.28.6
pkgrel=1
pkgdesc="Common C routines used by GTK+ and other libs"
url="http://www.gtk.org/"
arch=(i686 x86_64)
license=('LGPL')
depends=('pcre>=8.02' 'kernel26-debug-utrace')
makedepends=('pkgconfig' 'python2')
options=('!libtool' '!docs')
conflicts=('glib2')
source=(http://ftp.gnome.org/pub/GNOME/sources/glib/2.28/glib-${pkgver}.tar.bz2
        glib2.sh
        glib2.csh)
sha256sums=('557fb7c39d21b9359fbac51fd6b0b883bc97a2561c0166eef993a4078312f578'
            '9456872cdedcc639fb679448d74b85b0facf81033e27157d2861b991823b5a2a'
            '8d5626ffa361304ad3696493c0ef041d0ab10c857f6ef32116b3e2878ecf89e3')

build() {
  cd "${srcdir}/glib-${pkgver}"
  ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --enable-systemtap \
      --with-pcre=system \
      --disable-fam
  make
}

package() {
  cd "${srcdir}/glib-${pkgver}"
  sed -i 's/libglib-2.0.so.0.2800.6/usr\/lib\/libglib-2.0.so.0.2800.6/g' glib/glib.stp
  sed -i 's/libgobject-2.0.so.0.2800.6/usr\/lib\/libgobject-2.0.so.0.2800.6/g' gobject/gobject.stp
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/etc/profile.d"
  install -m755 "${srcdir}/glib2.sh" "${pkgdir}/etc/profile.d/"
  install -m755 "${srcdir}/glib2.csh" "${pkgdir}/etc/profile.d/"

  for _i in "${pkgdir}/etc/bash_completion.d/"*; do
      chmod -x "${_i}"
  done
}
