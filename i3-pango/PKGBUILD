# $Id: PKGBUILD 69901 2012-04-26 05:53:01Z ttopper $
# Maintainer: Patrice Peterson <runiq@archlinux.us>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>

pkgname=i3-pango
_pkgsourcename=i3
pkgver=4.2
pkgrel=2
pkgdesc="An improved dynamic tiling window manager. With pango support"
arch=('i686' 'x86_64')
url="http://i3wm.org/"
license=('BSD')
replaces=("i3" "i3bar")
groups=("i3")
depends=('libxcursor' 'xcb-util-wm' 'xcb-util-keysyms' 'libev' 'yajl' 'startup-notification' 'pcre' 'pango')
makedepends=('bison' 'flex')
optdepends=('rxvt-unicode: The terminal emulator used in the default config.'
            'dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display systeminformation with a bar.'
            'perl: To migrate your configuration to v4 format.')
provides='i3-wm'
conflicts=('i3-wm' 'i3bar' 'i3bar-git')
options=('docs' '!strip')
source=("http://i3wm.org/downloads/${_pkgsourcename}-${pkgver}.tar.bz2"
        "i3-wm-pango.patch")
md5sums=('11b7e5ecdd837341978c72341cb890c6'
         'e1866c6a9dd1ebabb2d7bec3aeb07b3c')

build() {
  cd "$srcdir/$_pkgsourcename-$pkgver"

  # Apply pango patches
  msg "Applying pango patch"
  patch -p1 -i "$srcdir/i3-wm-pango.patch"
  
  # In order to avoid problems with bison use only a single process
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
