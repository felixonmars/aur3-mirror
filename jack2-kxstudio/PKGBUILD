# $Id$
# Maintainer: falkTX <falktx@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Daniele Paolella <danielepaolella@email.it>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>
# Contributor: Thomas Bahn <thomas-bahn at gmx dot net>

pkgbase=jack2-kxstudio
pkgname=('jack2-kxstudio')
true && pkgname=('jack2-kxstudio' 'jack2-kxstudio-dbus')
#pkgname= # single build (overrides split)
_tarname=jack
pkgver=1.9.9.5
pkgrel=1
arch=('i686' 'x86_64')
url="http://jackaudio.org/"
backup=(etc/security/limits.d/99-audio.conf)
license=('GPL')
makedepends=('python2' 'libffado' 'celt'
             'libsamplerate' 'dbus-core')
source=("https://dl.dropbox.com/u/28869550/jack-1.9.9.5.tar.bz2"
        '99-audio.conf'
        '40-hpet-permissions.rules'
        'jack2-no-self-connect-1.9.9.5.patch'
        'jack2-driver-name-1.9.9.5.patch')
md5sums=('6c9de6b89db9d7076fa2ce222816cf4c'
         'ae65b7c9ebe0fff6c918ba9d97ae342d'
         '471aad533ff56c5d3cbbf65ce32cadef'
         'e45bccf3831c3ab6def0e3b8c4fc97ae'
         'a38fb8524fd4ec30ca5a2a80e70808d2')

_pyfix() {
  sed -i 's:bin/env python:bin/env python2:' \
    "$pkgdir/usr/bin/jack_control"
}

_wafconf() {
  python2 waf configure --prefix=/usr \
                        --alsa \
                        --firewire \
                        --clients=256 --ports-per-application=2048 \
                        $@

  # not building with doxygen
  # see https://github.com/jackaudio/jack2/issues/22
}

_isbuild() {
  printf "%s\n" ${pkgname[@]} | grep -qx $1
}

build() {
  cd "$srcdir"

  # Some optimisation bug exists for current GCC
  # see http://gcc.gnu.org/bugzilla/show_bug.cgi?id=53663
  export CFLAGS="${CFLAGS/-O[0-9]/-O0}"
  export CXXFLAGS="$CFLAGS"

  # fix doxygen building
  # TODO: report upstream, but redundant until gihub issue 22 resolves
  #sed -i 's:build/default/html:html:' $_tarname-$pkgver/wscript

  # we may do 2 different builds
  cp -r $_tarname-$pkgver $_tarname-dbus-$pkgver

  # mixed dbus/classic build
  if _isbuild jack2-kxstudio; then
    cd $_tarname-$pkgver
    msg2 "Running Mixed D-Bus/Classic build"
    patch -p1 < "$srcdir/jack2-no-self-connect-1.9.9.5.patch"
    patch -p1 < "$srcdir/jack2-driver-name-1.9.9.5.patch"
    _wafconf --classic --dbus --autostart=dbus
    python2 waf build $MAKEFLAGS
    cd ..
  fi

  # dbus-ONLY build
  if _isbuild jack2-kxstudio-dbus; then
    cd $_tarname-dbus-$pkgver
    msg2 "Running D-Bus-only build"
    patch -p1 < "$srcdir/jack2-no-self-connect-1.9.9.5.patch"
    patch -p1 < "$srcdir/jack2-driver-name-1.9.9.5.patch"
    _wafconf --dbus
    python2 waf build $MAKEFLAGS
    cd ..
  fi
}

package_jack2-kxstudio-dbus() {
  ! _isbuild jack2-kxstudio-dbus && return 0

  pkgdesc="The next-generation JACK with SMP support (for D-BUS interaction only), as packaged in KXStudio"
  depends=('libsamplerate' 'celt' 'dbus-core')
  optdepends=('libffado: FireWire support'
              'python2: jack_control')
  conflicts=('jack' 'jack2' 'jack2-dbus')
  provides=('jack' 'jack2' 'jack2-dbus' 'jackmp' 'jackdmp' 'jackdbus')

  cd "$srcdir/$_tarname-dbus-$pkgver"

  python2 waf install --destdir="$pkgdir"

  _pyfix

  install -Dm644 "$srcdir/99-audio.conf" \
    "$pkgdir/etc/security/limits.d/99-audio.conf"

  install -Dm644 "$srcdir/40-hpet-permissions.rules" \
    "$pkgdir/usr/lib/udev/rules.d/40-hpet-permissions.rules"
}

package_jack2-kxstudio() {
  ! _isbuild jack2-kxstudio && return 0

  pkgdesc="The next-generation JACK with SMP support, as packaged in KXStudio"
  depends=('libsamplerate' 'celt' 'dbus-core')
  optdepends=('libffado: FireWire support'
              'python2: jack_control')
  conflicts=('jack' 'jack2' 'jack2-dbus')
  provides=('jack' 'jack2' 'jack2-dbus' 'jackmp' 'jackdmp' 'jackdbus')

  cd "$srcdir/$_tarname-$pkgver"

  python2 waf install --destdir="$pkgdir"

  # fix for major python transition
  _pyfix

  # configure realtime access/scheduling
  # see https://bugs.archlinux.org/task/26343
  install -Dm644 "$srcdir/99-audio.conf" \
    "$pkgdir/etc/security/limits.d/99-audio.conf"

  install -Dm644 "$srcdir/40-hpet-permissions.rules" \
    "$pkgdir/usr/lib/udev/rules.d/40-hpet-permissions.rules"
}

# vim:set ts=2 sw=2 et:
