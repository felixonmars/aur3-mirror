# Maintainer: Tomoki Imai <tomo832@gmail.com>
# Contributor: Leonid.I, megadriver <megadriver at gmx dot com>
# This is basically the old evince-gtk PKGBUILD by pizzapunk
# This one DOES conflict with evince from [extra], on purpose :)

pkgname=evince2-light-xrandr-presentation-patch
pkgver=2.32.0
pkgrel=7
pkgdesc="Simply a document viewer with patch for presentation mode with xrandr (GTK2 version, GNOME free!)"
arch=('i686' 'x86_64')
url="http://projects.gnome.org/evince/"
license=('GPL')
depends=('gtk2' 'poppler-glib' 'libspectre' 'djvulibre' 't1lib' 'gsfonts' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('intltool')
provides=('evince')
conflicts=('evince')
options=('!libtool')
install=evince2-light.install
source=("http://ftp.gnome.org/pub/gnome/sources/evince/2.32/evince-$pkgver.tar.bz2"
        update-poppler.patch libview-crash.patch kill-missing-gconf-complaints.patch
        no-loading-window.patch view-presentation-size.patch)
md5sums=('ebc3ce6df8dcbf29cb9492f8dd031319'
         '10630dcef4486c00e58ef93963b4177f'
         '98139149793acd30188e037780e9a2cf'
         '0db697ba8cdca1deb889d36aaacf4f52'
         '110eb1b4b11b3205b13adb046f979a3a'
         '5b4589a9a6d69b5ff5c451a90701711d')



build() {
  cd "$srcdir"/evince-$pkgver

  patch -Np1 -i "$srcdir/libview-crash.patch"
  patch -Np1 -i "$srcdir/update-poppler.patch"
  patch -Np1 -i "$srcdir/no-loading-window.patch"
  patch -Np1 -i "$srcdir/kill-missing-gconf-complaints.patch"
  patch -Np1 -i "$srcdir/view-presentation-size.patch"
  sed -i -e '63d' configure.ac
  autoreconf -fi

  # Don't depend on gnome-icon-theme
  sed -i '/gnome-icon-theme/d' configure

  ./configure --prefix=/usr \
              --libexecdir=/usr/lib/evince \
              --disable-static \
              --disable-schemas-compile \
              --disable-tests \
              --disable-nautilus \
              --disable-scrollkeeper \
              --disable-help \
              --enable-t1lib \
              --enable-pixbuf \
              --enable-impress \
              --without-keyring \
              --without-gconf
  make LIBS=-lICE
}

package() {
  cd "$srcdir"/evince-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf $pkgdir/usr/share/GConf
}
