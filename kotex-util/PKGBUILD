# Contributor: jdj <djin.joo@gmail.com>

pkgname=kotex-util
pkgver=20100509
pkgrel=1
pkgdesc="Support scripts and binaries for ko.tex"
url="http://project.ktug.or.kr/ko.TeX/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('texlive-core' 'perl')
# optdepends=('java-runtime')
makedepends=()
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=(
  "http://ftp.ktug.or.kr/KTUG/ko.TeX/current/kotex-util-source-${pkgver}.tar.gz"
)
md5sums=(
  '680c8f916da97c723b1e34f7452ec24e'
)

build() {
  cd "$srcdir/source/latex/kotex-util"
  gcc -O2 -o hbibtex hbibtex.c
  gcc -O2 -o hmakeindex hmakeindex.c
}

package() {
  cd "$srcdir/source/latex/kotex-util"
  install -Dm 755 hbibtex "$pkgdir/usr/bin/hbibtex"
  install -Dm 755 hmakeindex "$pkgdir/usr/bin/hmakeindex"

  cd "$srcdir/scripts/kotex-util/perl"
  install -Dm 755 euc-bookmark.pl "$pkgdir/usr/bin/euc-bookmark"
  install -Dm 755 hypua2jamo.pl "$pkgdir/usr/bin/hypua2jamo"
  install -Dm 755 insertjamofiller.pl "$pkgdir/usr/bin/insertjamofiller"
  install -Dm 755 jamo2hypua.pl "$pkgdir/usr/bin/jamo2hypua"
  install -Dm 755 komkindex.pl "$pkgdir/usr/bin/komkindex"
  install -Dm 755 ttf2kotexfont.pl "$pkgdir/usr/bin/ttf2kotexfont"
}

# vim:set ts=2 sw=2 et:
