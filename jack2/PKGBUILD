# $Id: PKGBUILD 52694 2011-07-27 17:23:48Z schiv $
# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Daniele Paolella <danielepaolella@email.it>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>
# Contributor: Thomas Bahn <thomas-bahn at gmx dot net>
# Contributor: falkTX <falktx@gmail.com>

pkgbase=jack2
pkgname=('jack2-ladish')
true && pkgname=('jack2-ladish' 'jack2-dbus-ladish')
_tarname=jack
pkgver=1.9.7
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="The next-generation JACK with SMP support [special build for ladish]"
url="http://jackaudio.org/"
license=('GPL')
makedepends=('python2' 'doxygen' 'libffado' 'celt'
             'libsamplerate' 'dbus-core')
source=("http://www.grame.fr/~letz/$_tarname-$pkgver.tar.bz2"
        "no-selfconnect.patch"
        "use_jackdbus_settings.patch")
md5sums=('9759670feecbd43eeccf1c0f743ec199'
         '0bfb69acffbf70cc98f61b4f79ba32ea'
         'e7ac2f6931b9227002f82662b78fc2d0')

_pyfix() {
  sed -i 's:bin/env python:bin/env python2:' "$pkgdir/usr/bin/jack_control"
}

_wafconf() {
  python2 waf configure --prefix=/usr --alsa --firewire --mixed --clients=256 --doxygen $@
}

build() {
  cd "$srcdir"

  # fix doxygen building
  sed -i 's:build/default/html:html:' $_tarname-$pkgver/wscript

  # patch build
  cd $_tarname-$pkgver
  patch -p1 < ../../no-selfconnect.patch
  patch -p1 < ../../use_jackdbus_settings.patch
  cd ..

  # we're going to do 2 different builds
  cp -r $_tarname-$pkgver $_tarname-dbus-$pkgver

  # mixed dbus/classic build
  cd $_tarname-$pkgver
  msg2 "Running Mixed D-Bus/Classic build"
  _wafconf --classic --dbus
  python2 waf build $MAKEFLAGS

  # dbus-ONLY build
  cd ../$_tarname-dbus-$pkgver
  msg2 "Running D-Bus-only build"
  _wafconf --dbus
  python2 waf build $MAKEFLAGS
}

package_jack2-ladish() {
  pkgdesc="The next-generation JACK with SMP support [special build for ladish]"
  depends=('libsamplerate')
  optdepends=('libffado: FireWire support'
              'celt: NetJACK2 driver'
              'dbus-core: jackdbus'
              'python2: jack_control')
  conflicts=('jack' 'lib32-jack')
  provides=('jack' 'jack-audio-connection-kit' 'jackdbus'
            'jack-audio-connection-kit-mp' 'jackmp' 'jackdmp'
            'jack2' 'jack2-dbus' 'lib32-jack')

  cd "$srcdir/$_tarname-$pkgver"

  python2 waf install --destdir="$pkgdir"

  # fix for major python transition
  _pyfix
}

package_jack2-dbus-ladish() {
  pkgdesc="The next-generation JACK with SMP support (for D-BUS interaction only) [special build for ladish]"
  depends=('libsamplerate' 'dbus-core')
  optdepends=('libffado: FireWire support'
              'celt: NetJACK2 driver'
              'python2: jack_control')
  conflicts=('jack' 'jack2')
  provides=('jack' 'jack2' 'jack-audio-connection-kit' 'jackdbus'
            'jack-audio-connection-kit-mp' 'jackmp' 'jackdmp', 'lib32-jack')

  cd "$srcdir/$_tarname-dbus-$pkgver"

  python2 waf install --destdir="$pkgdir"

  _pyfix
}
