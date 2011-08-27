# Contributor: Alex Suykov <axs@ukr.net>

# Look at the first line in edict to see its version
pkgname=xjdic-edict
pkgver=20110123
pkgrel=1
pkgdesc="(required) primary dictionary for xjdic"
arch=('i686' 'x86_64')
url="http://www.csse.monash.edu.au/~jwb/edict.html"
license=('custom')
makedepends=(xjdic)
source=(ftp://ftp.monash.edu.au/pub/nihongo/edict.gz \
  ftp://ftp.monash.edu.au/pub/nihongo/edict_doc.html \
  http://www.edrdg.org/edrdg/licence.html)
# Useless -- the file is changed every day -- but gives user
# a chance to fix $pkgver above
md5sums=('066c78d58c6de639952194a33c152bad'
         'f11623961ce6ed0c05f92eb9fb17a856'
         'eb8b19e1bd6f882c4c1600cd73d2bc56')

build() {
  xjdxgen edict
  mkdir -p "$pkgdir/usr/share/xjdic/doc"
  install -m 0644 edict{,.xjdx} "$pkgdir/usr/share/xjdic"
  install -m 0644 edict_doc.html "$pkgdir/usr/share/xjdic/doc"
  install -D -m 0644 licence.html "$pkgdir/usr/share/licenses/$pkgname/license.html"
}

# vim:set ts=2 sw=2 et:
