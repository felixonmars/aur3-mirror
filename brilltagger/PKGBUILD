# Maintainer: jpate <j.k.pate@sms.ed.ac.uk>
pkgname=brilltagger
pkgver=1.14
maintainer="jpate"
pkgrel=2
pkgdesc="Eric Brill's Part Of Speech (POS) Tagger"
arch=('x86_64' 'i686')
url="http://cst.dk/download/uk/index.html#tagger"
license=('Custom')
depends=( )
source=("http://cst.dk/download/tagger/RBT1_14.tar.Z")
md5sums=('4ca5b62c32c4f99e53185ee1b8ee1167')

build() {
  cd $srcdir/RULE_BASED_TAGGER_V1.14/


  make || return 1

  install -dm 755 $pkgdir/usr/bin
  install -dm 755 $pkgdir/usr/share/licenses/brilltagger
  install -dm 755 $pkgdir/usr/share/brilltagger/data

  install -Dm 755 Bin_and_Data/tagger $pkgdir/usr/bin/
  install -Dm 755 Bin_and_Data/nbest-tagger $pkgdir/usr/bin/
  install -Dm 755 Bin_and_Data/start-state-tagger $pkgdir/usr/bin/
  install -Dm 755 Bin_and_Data/final-state-tagger $pkgdir/usr/bin/
  install -Dm 755 Bin_and_Data/fix-kbest-rule-learn $pkgdir/usr/bin/
  install -Dm 755 Bin_and_Data/kbest-contextual-rule-learn $pkgdir/usr/bin/
  install -Dm 755 Bin_and_Data/contextual-rule-learn $pkgdir/usr/bin/


  install -Dm 644 Bin_and_Data/*{WSJ,BROWN,NOLEX,BIGRAMS,NBEST-RULES} $pkgdir/usr/share/brilltagger/data/


  ln -s $pkgdir/usr/share/brilltagger/data/CONTEXTUALRULEFILE.WSJ $pkgdir/usr/share/brilltagger/data/CONTEXTUALRULEFILE
  ln -s $pkgdir/usr/share/brilltagger/data/LEXICALRULEFILE.WSJ $pkgdir/usr/share/brilltagger/data/LEXICALRULEFILE
  ln -s $pkgdir/usr/share/brilltagger/data/LEXICON.BROWN.AND.WSJ $pkgdir/usr/share/brilltagger/data/LEXICON


  install -Dm 644 COPYRIGHT $pkgdir/usr/share/licenses/brilltagger/LICENSE

}

