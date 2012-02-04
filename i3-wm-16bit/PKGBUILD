# $Id: PKGBUILD 58366 2011-11-12 13:28:03Z ttopper $
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Maintainer: Vladimir Chizhov <master@mirlord.com>

pkgname=i3-wm-16bit
_pkgsourcename=i3
pkgver=4.1
pkgrel=1
pkgdesc="An improved dynamic tiling window manager with 16-bit color support"
arch=('i686' 'x86_64' 'armv7h')
url="http://i3wm.org/"
license=('BSD')
replaces=("i3" "i3bar")
groups=("i3")
depends=('libxcursor' 'libev' 'yajl' 'startup-notification' 'pcre')
makedepends=('bison' 'flex')
optdepends=('rxvt-unicode: The terminal emulator used in the default config.'
            'dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display systeminformation with a bar.'
            'perl: To migrate your configuration to v4 format.')
options=('docs' '!strip')
source=(http://i3wm.org/downloads/${_pkgsourcename}-${pkgver}.tar.bz2
        0001-Color-depth-awareness.patch
        0002-16-bit-color-depth-awareness-part-2-for-i3bar.patch)
md5sums=('1a05d605624506c2b4b9f1272fd84a5a'
         'da6938310ed77de8f7f2707427d477e5'
         '20f17b4de6f5a4d7f735c5b7bb6f9d8a')

build() {
  cd "$srcdir/$_pkgsourcename-$pkgver"

  patch -Np1 < $srcdir/0001-Color-depth-awareness.patch
  patch -Np1 < $srcdir/0002-16-bit-color-depth-awareness-part-2-for-i3bar.patch

  # To avoid problems with bison use only a single process
  MAKEFLAGS="-j1"
  make
}

package() {
  cd "$srcdir/$_pkgsourcename-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -Dm644 man/i3.1 \
    ${pkgdir}/usr/share/man/man1/i3.1
  install -Dm644 i3bar/doc/i3bar.1 \
    ${pkgdir}/usr/share/man/man1/i3bar.1
  install -Dm644 man/i3-config-wizard.1 \
    ${pkgdir}/usr/share/man/man1/i3-config-wizard.1
  install -Dm644 man/i3-input.1 \
    ${pkgdir}/usr/share/man/man1/i3-input.1
  install -Dm644 man/i3-msg.1 \
    ${pkgdir}/usr/share/man/man1/i3-msg.1
  install -Dm644 man/i3-migrate-config-to-v4.1 \
    ${pkgdir}/usr/share/man/man1/i3-migrate-config-to-v4.1
  install -Dm644 man/i3-nagbar.1 \
    ${pkgdir}/usr/share/man/man1/i3-nagbar.1
  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  make clean
}

# vim:set ts=2 sw=2 et:
