# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=pulseaudio-bluez4
_pkgname=pulseaudio
pkgdesc="A featureful, general-purpose sound server"
pkgver=5.0
pkgrel=1
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/PulseAudio"
license=(LGPL AGPL3)
makedepends=(libasyncns libcap attr libxtst libsm libsamplerate libtool rtkit
             speex tdb systemd dbus avahi gconf intltool jack2-dbus sbc
             lirc-utils openssl xenstore fftw orc json-c gtk3 webrtc-audio-processing
             check git)
options=(!emptydirs)
source=(http://freedesktop.org/software/$_pkgname/releases/$_pkgname-$pkgver.tar.xz)
sha256sums=('99c13a8b1249ddbd724f195579df79484e9af6418cecf6a15f003a7f36caf939')

prepare() {
  cd $_pkgname-$pkgver
}

build() {
  cd $_pkgname-$pkgver

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --with-udev-rules-dir=/usr/lib/udev/rules.d \
    --with-database=tdb \
    --disable-tcpwrap \
    --disable-rpath \
    --disable-default-build-tests

  # fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  depends=(rtkit libltdl speex tdb fftw orc
           libsamplerate webrtc-audio-processing sbc)
  optdepends=('pulseaudio-alsa: ALSA configuration (recommended)'
              'avahi: zeroconf publishing and discovery'
              'bluez: Bluetooth'
              'bluez-libs: Bluetooth'
              'bluez4: Bluetooth, legacy version'
              'gconf: paprefs configuration'
              'jack2-dbus: JACK support'
              'lirc-utils: IR control'
              'openssl: RAOP (AirPlay) output'
              'python-pyqt4: Equalizer GUI (qpaeq)'
              'xenstore: Xen paravirtual output')
  provides=("libpulse=$pkgver" "pulseaudio=$pkgver")
  conflicts=('pulseaudio' 'libpulse')
  backup=(etc/pulse/{client.conf,daemon.conf,default.pa,system.pa})

  cd $_pkgname-$pkgver
  make -j1 DESTDIR="$pkgdir" install \
    bashcompletiondir=/usr/share/bash-completion/completions

  # Speed up pulseaudio shutdown so that it exits immediately with
  # the last user session (module-systemd-login keeps it alive)
  sed -e '/exit-idle-time/iexit-idle-time=0' \
      -i "$pkgdir/etc/pulse/daemon.conf"

  # Disable cork-request module, can result in e.g. media players unpausing
  # when there's a Skype call incoming
  sed -e 's|/usr/bin/pactl load-module module-x11-cork-request|#&|' \
      -i "$pkgdir/usr/bin/start-pulseaudio-x11"

  rm "$pkgdir/etc/dbus-1/system.d/pulseaudio-system.conf"

  install -Dm644 shell-completion/pulseaudio-zsh-completion.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_pulseaudio"
}
