
# Maintainer: anergy <anergy.25110321@gmail.com>
pkgname=texlive-jsarticle
pkgver=140207
pkgrel=1
epoch=
pkgdesc="Document class file for Japanese tex (pLaTeX2e)."
arch=('any')
url="http://oku.edu.mie-u.ac.jp/~okumura/jsclasses/"
license=('BSD')
groups=()
depends=('texlive-bin' 'texlive-core')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=("http://oku.edu.mie-u.ac.jp/~okumura/jsclasses/jsclasses-$pkgver.zip"
        "http://oku.edu.mie-u.ac.jp/~okumura/texfaq/jis-tfm.zip"
        "http://oku.edu.mie-u.ac.jp/~okumura/texfaq/jis-pl.zip"
        "japanese-jis.map")
noextract=(jsclasses-$pkgver.zip)

build() {
  cd $srcdir
  makejvf jis.tfm     rml
  makejvf jisn.tfm    rmln
  makejvf jis-v.tfm   rmlv
  makejvf jisn-v.tfm  rmlnv
  makejvf jisg.tfm    gbm
  makejvf jisgn.tfm   gbmn
  makejvf jisg-v.tfm  gbmv
  makejvf jisgn-v.tfm gbmnv
  return 0
}


check() {
  return 0
}

package() {
  cd $srcdir
  install -m 755 -d $pkgdir/usr/share/texmf-dist/fonts/tfm/jis
  install -m 755 -d $pkgdir/usr/share/texmf-dist/fonts/source/jis
  install -m 755 -d $pkgdir/usr/share/texmf-dist/fonts/vf/jis
  install -m 755 -d $pkgdir/usr/share/texmf-dist/tex/platex/js

  cp -fpd *.tfm $pkgdir/usr/share/texmf-dist/fonts/tfm/jis
  cp -fpd *.pl $pkgdir/usr/share/texmf-dist/fonts/source/jis
  cp -fpd *.vf $pkgdir/usr/share/texmf-dist/fonts/vf/jis
  
  install -m 644 -D japanese-jis.map $pkgdir/usr/share/texmf/dvips/config/japanese-jis.map
  cd $pkgdir/usr/share/texmf-dist/tex/platex/js
  bsdtar -xf $srcdir/jsclasses-$pkgver.zip
  
}

md5sums=('d8a31910c27ffae3106b47e8e94c97bf'
         'd56606723026b60393ea48a4dab65994'
         'f39bc002da3e4dd5a17c6917f3f10b6c'
         '5801aa78360fcba43da99b1147398652')
# vim:set ts=2 sw=2 et:
md5sums=('e650d3572e39b68b83a1987f8e24ea78'
         'd56606723026b60393ea48a4dab65994'
         'f39bc002da3e4dd5a17c6917f3f10b6c'
         '5801aa78360fcba43da99b1147398652')
