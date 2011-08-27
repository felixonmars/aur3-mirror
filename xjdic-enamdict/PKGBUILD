# Contributor: Alex Suykov <axs@ukr.net>
pkgname=xjdic-enamdict
pkgver=20081202
pkgrel=1
pkgdesc="(optional) proper names dictionary for xjdic"
arch=('i686' 'x86_64')
url="http://www.csse.monash.edu.au/~jwb/edict.html"
license=('custom')
makedepends=(xjdic)
# AUR f**ks things up if nonstandard variables are used
# here, so we'll use complete file names.
source=(ftp://ftp.monash.edu.au/pub/nihongo/enamdict.gz \
  ftp://ftp.monash.edu.au/pub/nihongo/enamdict_doc.html \
  http://www.edrdg.org/edrdg/licence.html)
# Useless -- the file is changed every day -- but gives user
# a chance to fix $pkgver above
md5sums=('4b44914c0930ba48a16a4cadd678d7ae'
         '2a8da099f18cb33ca9e6ccb8fb7cfb80'
         '94129bf49a83044764700910c7ee5c53')

build() {
  xjdxgen enamdict
  mkdir -p "$pkgdir/usr/share/xjdic/doc"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0644 enamdict{,.xjdx} "$pkgdir/usr/share/xjdic"
  install -m 0644 enamdict_doc.html "$pkgdir/usr/share/xjdic/doc"
  install -m 0644 licence.html "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
