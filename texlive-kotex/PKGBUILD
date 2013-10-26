# Maintainer: xylosper <darklin20@gmail.com>

_name="kotex"
pkgname=("texlive-$_name")
pkgver=2013
pkgrel=3
pkgdesc="ko.TeX macros for etex/pdftex engines, base fonts and utilities"
arch=('i686' 'x86_64')
_ktug="http://ftp.ktug.org/KTUG/texlive/$pkgver/archive"
url="http://project.ktug.org/ko.TeX"
license=('GPL')
depends=('texlive-core' 'texlive-bin' 'perl')
source=($_ktug/$_name.tar.xz $_ktug/$_name-base.tar.xz $_ktug/$_name-utils.tar.xz texlive-kotex.maps)
md5sums=('baaff80451d275b0b60d292b667d476f' '64edab7da1d6030301c96a26e85b2b31' '1ff649747d8c8d9b5f5cd0615c7c371a' '25af5a8fd6c63859a991237d0c4aac08')
if test "$CARCH" == x86_64; then
  source+=($_ktug/$_name-utils.x86_64-linux.tar.xz) 
  md5sums+=('e60e58f6c9694976ce5e742a25c03b42')
else
  source+=($_ktug/$_name-utils.i386-linux.tar.xz)
  md5sums+=('cc06bd393857f4f247318016a0bd2c9c')
fi
_dest="/usr/share/texmf-dist"
install="texlive.install"

build() {
  cd "$srcdir"
  rm -rf tlpkg *.tar.xz
}

package() {
  cd "$srcdir"
  install -d -m755 $pkgdir/var/lib/texmf/arch/installedpkgs
  install -d -m755 "$pkgdir$_dest"
  install -d -m755 "$pkgdir/usr/bin"

# sed -i '/^#/d' CONTENTS
# install -m644 CONTENTS $pkgdir/var/lib/texmf/arch/installedpkgs/${pkgname}_${_revnr}.pkgs

  install -m644 $pkgname.maps $pkgdir/var/lib/texmf/arch/installedpkgs/
  cp -a `ls | sed 's/texmf-dist$//g' | sed 's/^.*maps$//g'` "$pkgdir$_dest"
  cp -a texmf-dist/* "$pkgdir$_dest"
  #cp -a bin/*-linux/hbibtex bin/*-linux/hmakeindex "$pkgdir/usr/bin"
  #ln -s $_dest/scripts/korean/perl/euc-bookmark.pl $pkgdir/usr/bin/euc-bookmark
  ln -s $_dest/scripts/korean/perl/hypua2jamo.pl $pkgdir/usr/bin/hypua2jamo
  ln -s $_dest/scripts/korean/perl/insertjamofiller.pl $pkgdir/usr/bin/insertjamofiller
  ln -s $_dest/scripts/korean/perl/jamo-normalize.pl $pkgdir/usr/bin/jamo-normalize
  ln -s $_dest/scripts/korean/perl/jamo2hypua.pl $pkgdir/usr/bin/jamo2hypua
  ln -s $_dest/scripts/korean/perl/komkindex.pl $pkgdir/usr/bin/komkindex
  ln -s $_dest/scripts/korean/perl/kotexindy.pl $pkgdir/usr/bin/kotexindy
  ln -s $_dest/scripts/korean/perl/ttf2kotexfont.pl $pkgdir/usr/bin/ttf2kotexfont
}
