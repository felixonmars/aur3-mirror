# Contributor: Michael Schmarck <michael@schmarck.cn>
# Based on gill-sans-font by Rudolf Olah <omouse@gmail.com> and
# ttf-anonymous by ezzetabi <ezzetabi at gawab dot com>
pkgname=ttf-gill-sans
pkgver=1
pkgrel=2
pkgdesc="Gill Sans font found on Mac OS X, converted by fondu"
arch=(x86_64 i686)
url="http://en.wikipedia.org/wiki/Gill_Sans"
license=(custom)
depends=(fontconfig xorg-fonts-encodings xorg-font-utils)
install=ttf-gill-sans.install
replaces=(gill-sans-font)
source=()
md5sums=()

build() {
  cd $startdir

  install -d -m755 "$startdir"/pkg/usr/share/fonts/TTF || return 1
  install -m644 *.ttf "$startdir"/pkg/usr/share/fonts/TTF || return 1
}
