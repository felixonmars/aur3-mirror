# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=fsthost
pkgver=1.5.4
pkgrel=1
pkgdesc="A linux VST host using winelib, fork of FreeST."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/fsthost/"
license=('GPL')
depends=('alsa-lib' 'lash' 'libxml2' 'gtk2')
[[ "$CARCH" = 'x86_64' ]] && _arch=32 && \
depends=(${depends[@]/#/lib32-})
depends+=('wine')
optdepends=('zenity: for fsthost_menu')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('781f9f5e01b2703b0a6b2745098b6f6f')

prepare() {
  cd $pkgname-$pkgver

  # use -fPIC flag for 32bit too
  # in order to avoid text relocations
  [[ "$CARCH" = 'x86_64' ]] && \
  sed "s/no-pic -fno-//" -i Makefile

  # missing lash cflags
  export CFLAGS+=" $(pkg-config --cflags lash-1.0)"
}

build() {
  cd $pkgname-$pkgver
  make LIB32_INST_PATH=/usr/lib$_arch \
       LIB64_INST_PATH=/usr/lib GTK2=1
}

package() {
  cd $pkgname-$pkgver
  make LIB32_INST_PATH=/usr/lib$_arch \
       LIB64_INST_PATH=/usr/lib GTK2=1 \
       MANDIR=/usr/share/man/man1 \
       DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
