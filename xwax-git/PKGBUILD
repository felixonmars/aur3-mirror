# Maintainer: Maxwell Pray a.k.a. Synthead <mpray@synthead.com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: sputnick <gilles DOT quenot AT gmail DOT com>

pkgname="xwax-git"
pkgver="20140518"
pkgrel="2"
pkgdesc="Open-source vinyl emulation software for Linux."
arch=("i686" "x86_64")
url="http://xwax.org/"
license=("GPL")
depends=("alsa-lib" "sdl_ttf" "ttf-dejavu")
optdepends=(
  "cdparanoia: for CD import"
  "mpg123: for MP3 import"
  "ffmpeg: for video fallback import"
)
provides=("xwax")
conflicts=("xwax")
source=(
  "xwax-unicode-support.patch"
  "xwax-ten-key.patch"
  "xwax-ctrl-and-shift-references-in-man-page.patch"
)
sha1sums=(
  "66e177ec0cf7a0e2bd93f97333e15f8df828777c"
  "dfb39cd6be4250421970e5988f88a02979a8b6bd"
  "3f08630eaa05fe0914dd8cda2f318b9d1fdc689b"
)

_gitroot="http://xwax.org/devel/xwax.git"
_gitname="xwax"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
  else
    git clone "$_gitroot" "$_gitname"
  fi

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # patch "rig.c" to use Arch Linux's default rtprio value
  sed -i 's/^#define REALTIME_PRIORITY 80/#define REALTIME_PRIORITY 65/' rig.c

  patch -p 1 < "$srcdir/xwax-unicode-support.patch"
  patch -p 1 < "$srcdir/xwax-ten-key.patch"
  patch -p 1 < "$srcdir/xwax-ctrl-and-shift-references-in-man-page.patch"

  ./configure --enable-alsa --prefix /usr
  make EXECDIR="/usr/share/${pkgname%-git}"
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" EXECDIR="/usr/share/${pkgname%-git}" install
}
