# Contributor: Felix Hanley <felix@seconddrawer.com.au>
pkgname=dictd-moby-thesaurus
pkgver=1.0
pkgrel=2
pkgdesc="Moby thesaurus for dict"
arch=('any')
url="http://www.dict.org"
license=('none')
depends=('dictd')
source=('ftp://ftp.dict.org/dict/pre/debian/dict-moby-thesaurus_1.0-5.tar.gz')
md5sums=('b44d822e90f1a875aa0f5f8d02e3ffea')
build() {
  install -D -m 0644 $startdir/src/moby-thesaurus.dict.dz $startdir/pkg/usr/share/dictd/moby-thesaurus.dict.dz
  install -D -m 0644 $startdir/src/moby-thesaurus.index $startdir/pkg/usr/share/dictd/moby-thesaurus.index
}
