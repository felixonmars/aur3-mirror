# Contributor: Alex Suykov <axs@ukr.net>

# Look at the first line of kanjidic to see it's version
pkgname=xjdic-kanjidic
pkgver=20081201
pkgrel=1
pkgdesc="(required) Kanji dictionary for xjdic"
arch=('i686' 'x86_64')
url="http://www.csse.monash.edu.au/~jwb/kanjidic.html"
license=('custom')
makedepends=(xjdic)
source=(ftp://ftp.monash.edu.au/pub/nihongo/kanjidic.gz \
  ftp://ftp.monash.edu.au/pub/nihongo/kanjidic.doc \
  COPYING)
# Useless -- the file is changed every day -- but gives user
# a chance to fix $pkgver above
md5sums=('9b03c102654e44be81a32faa6c9b7670'
         '78f26bb9d86fed7968c8371d2a83dd1a'
         'db0f908e3115d2c0ad1f94499cee6a20')

build() {
  xjdxgen kanjidic
  mkdir -p "$pkgdir/usr/share/xjdic/doc"
  install -m 0644 kanjidic{,.xjdx} "$pkgdir/usr/share/xjdic"
  install -m 0644 kanjidic.doc "$pkgdir/usr/share/xjdic/doc"
  install -D -m 0644 COPYING "$pkgdir/usr/share/licenses/xjdic-kanjidic/COPYING"
}

# vim:set ts=2 sw=2 et:
