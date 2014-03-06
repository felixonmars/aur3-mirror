# Maintainer: jsteel <mail at jsteel dot org>

pkgname=lightning
pkgver=2.6.4
pkgrel=1
pkgdesc="An integrated calendar extension for Mozilla Thunderbird"
arch=('i686' 'x86_64')
url="http://www.mozilla.org/projects/calendar/lightning"
license=('MPL' 'GPL' 'LGPL')
depends=('thunderbird' 'libnotify')
conflicts=('lightning-bin')
makedepends=('libnotify' 'python2' 'unzip' 'zip' 'gtk2' 'dbus-glib' 'alsa-utils' 'yasm' 'glib' 'libidl2' 'mesa')
source=(https://addons.mozilla.org/thunderbird/downloads/latest/2313/platform:2/addon-2313-latest.xpi?src=dp-btn-primary)
md5sums=('2a8bf9633c7cba791596ef54001cf5f6')

build() {
  cd "$srcdir/comm-release"

  echo 'ac_add_options --prefix=/usr/local/thunderbird
ac_add_options --disable-tests
ac_add_options --disable-debug
ac_add_options --disable-shared
ac_add_options --disable-necko-wifi
ac_add_options --disable-accessibility
ac_add_options --disable-angle
ac_add_options --enable-static
ac_add_options --enable-crypto
ac_add_options --enable-application=mail
ac_add_options --enable-calendar
ac_add_options --without-system-nspr
ac_add_options --without-system-zlib
ac_add_options --without-system-jpeg
ac_add_options --without-system-png
ac_add_options --without-system-mng
mk_add_options MOZ_OBJDIR=@TOPSRCDIR@/objdir-tb-release
mk_add_options MOZILLA_DIR=@TOPSRCDIR@/mozilla
mk_add_options MOZ_MAKE_FLAGS="-j2"' > .mozconfig

  make -f client.mk
}

package() {
  _emid=`grep em:id $srcdir/comm-release/objdir-tb-release/mozilla/dist/xpi-stage/$pkgname/install.rdf | tail -n1 | sed 's/.*>\(.*\)<.*/\1/'`
  mkdir -p $pkgdir/usr/lib/thunderbird/extensions/$_emid
  cd $pkgdir/usr/lib/thunderbird/extensions/$_emid
  cp -R "$srcdir/comm-release/objdir-tb-release/mozilla/dist/xpi-stage/$pkgname/"* .
  find -type d -exec chmod 0755 \{\} \+
  find -type f -exec chmod 0644 \{\} \+
}
