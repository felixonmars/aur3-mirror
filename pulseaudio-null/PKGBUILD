pkgbase=pulseaudio-null
pkgname=(pulseaudio-null)
realbase=pulseaudio
realname=(pulseaudio)
pkgdesc="A featureful, general-purpose sound server"
pkgver=1.1
pkgrel=1
arch=(i686 x86_64)
url="http://pulseaudio.org/"
license=(GPL LGPL)
makedepends=(libasyncns libcap attr libxtst libsm libsamplerate libtool rtkit
             speex tdb udev dbus-core xcb-util avahi bluez gconf intltool jack
             lirc-utils openssl fftw orc json-c)
options=(!emptydirs !libtool !buildflags)
source=(http://freedesktop.org/software/$realbase/releases/$realbase-$pkgver.tar.xz
        $pkgbase.xinit)

build() {
  cd "$srcdir/$realbase-$pkgver"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --with-database=tdb \
    --disable-hal \
    --disable-tcpwrap \
    --disable-rpath \
    --disable-default-build-tests

  make
}

package_pulseaudio-null() {
  depends=("libpulse=$pkgver-$pkgrel" rtkit libtool speex tdb udev fftw orc
           libsamplerate)
  optdepends=('avahi: zeroconf support'
              'bluez: bluetooth support'
              'gconf: configuration through gconf (paprefs)'
              'jack: jack support'
              'lirc-utils: infra-red support'
              'openssl: RAOP support'
              'python2-pyqt: Equalizer GUI (qpaeq)')
  conflicts=('pulseaudio')
  provides=("pulseaudio=${pkgver}")
  backup=(etc/pulse/{daemon.conf,default.pa,system.pa})
  install=pulseaudio.install
  cd "$srcdir/$realbase-$pkgver"
  make DESTDIR="$pkgdir" install

  # Lower resample quality, saves CPU
  sed -e '/resample-method/iresample-method=speex-float-0' \
      -i "$pkgdir/etc/pulse/daemon.conf"

  # Disable cork-request module, can result in e.g. media players unpausing
  # when there's a Skype call incoming
  sed -e 's|/usr/bin/pactl load-module module-x11-cork-request|#&|' \
      -i "$pkgdir/usr/bin/start-$realbase-x11"

  # Make some modules optional
  sed -e $'/load-module module-console-kit/{i.nofail\n;a.fail\n;}' \
      -e '/load-module module-jackdbus-detect/s/^/#/' \
      -i "$pkgdir/etc/pulse/default.pa"

  # Python fix
  sed -i '1s:python$:&2:' "$pkgdir/usr/bin/qpaeq"

  install -Dm755 "$srcdir/$pkgbase.xinit" "$pkgdir/etc/X11/xinit/xinitrc.d/$pkgbase"

  rm "$pkgdir/etc/dbus-1/system.d/$realbase-system.conf"

### Split libpulse

  mkdir -p "$srcdir"/libpulse/{etc/pulse,usr/{lib,share/man/man5}}

  mv {"$pkgdir","$srcdir/libpulse"}/etc/pulse/client.conf

  mv "$pkgdir"/usr/lib/libpulse{,dsp,-simple,-mainloop-glib}.so* \
     "$pkgdir"/usr/lib/libpulsecommon-*.so \
     "$srcdir/libpulse/usr/lib"

  mv {"$pkgdir","$srcdir/libpulse"}/usr/lib/pkgconfig
  mv {"$pkgdir","$srcdir/libpulse"}/usr/include

  mv {"$pkgdir","$srcdir/libpulse"}/usr/share/man/man5/pulse-client.conf.5
  mv {"$pkgdir","$srcdir/libpulse"}/usr/share/vala
}

sha256sums=('6fe531136f6ebce2d35872a2d2c914278cdc5dcdd5eea516dc52c81f9001f5ee'
            'da58c590dacf0fdd4b9076eb71f4de5db2cfb98fe81a44ed652a6478611a1ce5')
