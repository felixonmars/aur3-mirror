# Maintainer: Nathan Catlow <nat@recx.co.uk>
# Contributor: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

# I cannot take the full credit for this, it is an amended copy of the webkitgtk-hidpi package by Ivan Shapovalov <intelfx100@gmail.com>
# The original webkitgtk-svn package was created by Jonas Heinrich <onny@project-insanity.org> and was pkgrel=8

# 2.4.x can compile webkit1 and webkit2 but AFAICT is the last version that will support webkit1
# This package is for webkit1 only and will only compile the 2.4.x branch
# This an take up to three hours to compile maybe longer
# Because some of the headers (webkitenumtypes.h) are auto generated with a comment containing the working source path
# this always results in WARNING: Package contains reference to $srcdir

_pkgbase=webkitgtk-2.4
pkgbase=webkitgtk-svn
pkgname=(webkitgtk-svn webkitgtk2-svn)
pkgver=r183805
pkgrel=1
pkgdesc="GTK+ Web content engine library (webkit1) "
arch=(i686 x86_64)

url="http://webkitgtk.org/"
license=(custom)
depends=(libxt libxslt sqlite libsoup enchant libgl geoclue2 gst-plugins-base-libs
         libsecret libwebp harfbuzz-icu)
makedepends=(gtk3 gtk2 gperf gobject-introspection python2 mesa ruby)
optdepends=('gst-plugins-base: free media decoding'
            'gst-plugins-good: media decoding'
            'gst-libav: nonfree media decoding')
options=(!emptydirs)
source=(${_pkgbase}::svn+http://svn.webkit.org/repository/webkit/releases/WebKitGTK/webkit-2.4
        fix-pretty-quotes.patch)

sha256sums=('SKIP'
            '56316228bbbf0b7ebcbe210a35120f4e72cb9c1b680dd82cc2bde0f4549245e6')

pkgver() {
  cd "${_pkgbase}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  mkdir -p build-gtk{,2} path

  ln -sf /usr/bin/python2 path/python

  cd "${srcdir}/${_pkgbase}"
  patch -Np0 -i ../fix-pretty-quotes.patch

  #This autoreconf is copied from autogen.sh in the SVN directory
  autoreconf --verbose --force --install -I Source/autotools $ACLOCAL_FLAGS
}

_build() {
  _ver="$1"; shift
  cd "$srcdir/build-${_ver}"

  ${srcdir}/${_pkgbase}/configure --prefix=/usr \
    --libexecdir=/usr/lib/webkit${_ver} \
    --enable-introspection \
    --disable-webkit2 \
    --disable-gtk-doc \
    "$@"

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make all stamp-po
}

build() {
  PATH="$srcdir/path:$PATH"

  _build gtk
  _build gtk2 --with-gtk=2.0
}

package_webkitgtk-svn() {
  depends+=(gtk3)
  optdepends+=('gtk2: Netscape plugin support')
  provides=("webkitgtk3=${pkgver}" "libwebkit3=${pkgver}" webkitgtk)
  conflicts=(webkitgtk3 libwebkit3 webkitgtk webkitgtk-hdpi)
  replaces=(webkitgtk3 libwebkit3)

  make -C build-gtk -j1 DESTDIR="${pkgdir}" install
  install -Dm644 ${srcdir}/${_pkgbase}/Source/WebKit/LICENSE \
    "${pkgdir}/usr/share/licenses/webkitgtk/LICENSE"
}

package_webkitgtk2-svn() {
  pkgdesc+=" for GTK2"
  depends+=(gtk2)
  provides=("libwebkit=${pkgver}" webkitgtk2)
  conflicts=(libwebkit webkitgtk2-hdpi)
  replaces=(libwebkit)

  make -C build-gtk2 -j1 DESTDIR="${pkgdir}" install
  install -Dm644 ${srcdir}/${_pkgbase}/Source/WebKit/LICENSE \
    "${pkgdir}/usr/share/licenses/webkitgtk2/LICENSE"
}
