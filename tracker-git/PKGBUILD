# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Stefano Facchini <stefano.facchini at gmail.com>
# Contributor: Necronian <necronian at gmail dot com>
# Contributor: Emanuele Rossi <nuovodna at gmail dot com>
# Contributor: Frederic Bezies <fredbezies@gmail.com>

_pkgname=tracker
pkgbase=tracker-git
pkgname=("$pkgbase" "libtracker-git-sparql")
pkgver=1.1.4.r5.gca271d1
pkgrel=1
pkgdesc="All-in-one indexer, search tool and metadata database"
url="http://projects.gnome.org/tracker"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
makedepends=(libgee libsecret upower libexif exempi
             poppler-glib libgsf icu enca networkmanager gtk3
             desktop-file-utils hicolor-icon-theme gobject-introspection
             intltool giflib gst-plugins-base-libs totem-plparser
             taglib libvorbis flac vala libgxps libnautilus-extension libmediaart)
options=('!emptydirs')

install=tracker.install
source=("git://git.gnome.org/tracker"
    "tracker-1.0.1-giflib-5.1.0.patch")
md5sums=('SKIP'
         '3c5e21ec1ecedd217b53b03481798764')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  patch -p1 -i ../tracker-1.0.1-giflib-5.1.0.patch
}

build() {
  cd $_pkgname

    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib/tracker \
        --disable-unit-tests \
        --enable-libflac \
        --enable-libvorbis

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

package_tracker-git() {
  depends=("libtracker-sparql=$pkgver-$pkgrel" libgee libsecret
           upower libexif exempi poppler-glib libgsf enca
           networkmanager gtk3 desktop-file-utils hicolor-icon-theme libmediaart)
  optdepends=('giflib: extractor for GIF data'
              'gst-plugins-base-libs: video extractor'
              'totem-plparser: playlist support'
              'libvorbis: Vorbis metadata extractor'
              'flac: FLAC metadata extractor'
              'taglib: writeback for audio files'
              "nautilus: edit files' tracker tags"
              'libgxps: XPS extractor')
  groups=('gnome')
  conflicts=('tracker')
  provides=('tracker')
  install=tracker.install

  cd $_pkgname
  make DESTDIR="$pkgdir" install

  for dir in libtracker-{sparql,common,data,sparql-backend}
  do
    make DESTDIR="$pkgdir" -C src/$dir uninstall
  done

  rm -f "$pkgdir"/usr/lib/pkgconfig/tracker-sparql-*.pc
}

package_libtracker-git-sparql() {
  pkgdesc="$pkgdesc (SPARQL library)"
  depends=(sqlite icu glib2 libffi pcre util-linux)
  conflicts=('libtracker-sparql')
  provides=('libtracker-sparql')

  cd $_pkgname/src
  for dir in libtracker-{sparql,common,data,sparql-backend}
  do
    make DESTDIR="$pkgdir" -C $dir install
  done

  install -m755 -d "$pkgdir"/usr/lib/pkgconfig
  install -m644 ../data/tracker-sparql-*.pc "$pkgdir"/usr/lib/pkgconfig/
}
