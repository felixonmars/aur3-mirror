# Contributor: Johann Klähn <kljohann@gmail.com>
pkgname=knubbler
pkgver=16
pkgrel=1
pkgdesc="a scrollable progressbar (percentage input interface)."
arch=('i686' 'x86_64')
url="http://bbs.archlinux.org/viewtopic.php?id=64593"
license=('cc-by-nc-sa-3.0')
depends=('python' 'pygtk')
source=(knubbler.py knubbler.1)

build() {
  install -D -m 755 knubbler.py $pkgdir/usr/bin/knubbler || return 1
  install -D -m 644 knubbler.1 $pkgdir/usr/share/man/man1/knubbler.1 || return 1
}

md5sums=('1fdcccee95386c1050ba81156e2e81d5'
         '2f5c0d274b93feab00344494539fe522')
