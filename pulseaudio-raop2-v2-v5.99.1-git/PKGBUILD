# Maintainer: Jerome Leclanche <jerome.leclanche+arch@gmail.com>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi@gmail.com>
# Contributor: piernov <piernov@piernov.org>

branch=hf/raop2-v2-v5.99.1
pkgname="pulseaudio-raop2-v2-v5.99.1-git"
_pkgname="pulseaudio"
pkgdesc="A featureful, general-purpose sound server (with RAOP2 patches)"
pkgver=7903.4f5a034
pkgrel=1
arch=(i686 x86_64)
url="http://hfujita.github.io/pulseaudio-raop2/"
license=(LGPL AGPL3)
depends=('rtkit' 'libltdl' 'speex' 'tdb' 'fftw' 'orc' 'libsamplerate'
         'webrtc-audio-processing' 'sbc' 'dbus' 'libasyncns' 'libcap'
         'libxtst' 'libsm' 'libsndfile' 'json-c' 'systemd')
makedepends=('attr' 'avahi' 'bluez' 'bluez-libs' 'gconf' 'intltool' 'jack2-dbus'
             'lirc-utils' 'openssl' 'xenstore' 'gtk3' 'check' 'git')
optdepends=('alsa-plugins: ALSA support'
            'pulseaudio-alsa: ALSA configuration (recommended)'
            'avahi: zeroconf publishing and discovery'
            'bluez: Bluetooth'
            'bluez-libs: Bluetooth'
            'gconf: paprefs configuration'
            'jack2-dbus: JACK support'
            'lirc-utils: IR control'
            'openssl: RAOP (AirPlay) output'
            'python-pyqt4: Equalizer GUI (qpaeq)'
            'xenstore: Xen paravirtual output')
backup=(etc/pulse/{daemon.conf,default.pa,system.pa,client.conf})
provides=('pulseaudio' 'libpulse')
conflicts=('pulseaudio' 'libpulse')
replaces=('pulseaudio' 'libpulse')
options=(!emptydirs)
source=("git+https://github.com/hfujita/pulseaudio-raop2.git#branch=${branch}")
sha256sums=('SKIP')
_gitname="pulseaudio-raop2"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"

  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --with-udev-rules-dir=/usr/lib/udev/rules.d \
    --with-database=tdb \
    --disable-tcpwrap \
    --disable-bluez4 \
    --disable-rpath \
    --disable-default-build-tests


  # fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$srcdir/$_gitname"

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

  install -Dm644 shell-completion/zsh/_pulseaudio \
    "$pkgdir/usr/share/zsh/site-functions/_pulseaudio"
}
