# Maintainer: David H. Bronke <david.bronke@g33xnexus.com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>

pkgname=i3-xinerama
_pkgsourcename=i3
pkgver=3.d_bf1
pkgrel=2
pkgdesc="An improved dynamic tiling window manager; old version needed for full multi-monitor support on nVidia drivers"
arch=('i686' 'x86_64')
url="http://i3.zekjur.net/"
license=('BSD')
provides=("i3-wm")
conflicts=("i3-wm")
groups=("i3")
depends=('libx11' 'xcb-util' 'libev' 'yajl')
makedepends=('bison' 'flex')
optdepends=('rxvt-unicode: The terminal emulator used in the default config.'
            'dmenu: As menu.')
options=('docs' '!strip')
source=(http://i3.zekjur.net/downloads/$_pkgsourcename-${pkgver//_/-}.tar.bz2)
sha256sums=('2c741a78e94dd50abb9afc1012230da11cca587d6b3c744f2cd282789a65a48b')

build() {
  cd "$srcdir/$_pkgsourcename-${pkgver//_/-}"
  
  make || return 1
}

package() {
  cd "$srcdir/$_pkgsourcename-${pkgver//_/-}"
  make DESTDIR="$pkgdir/" install || return 1
  
  install -Dm644 man/i3.1 \
    ${pkgdir}/usr/share/man/man1/i3.1 || return 1
  install -Dm644 man/i3-msg.1 \
    ${pkgdir}/usr/share/man/man1/i3-msg.1 || return 1
  install -Dm644 man/i3-input.1 \
    ${pkgdir}/usr/share/man/man1/i3-input.1 || return 1
  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
  
  make clean
}

# vim:set ts=2 sw=2 et:
