# Maintainer: jpate <j.k.pate@sms.ed.ac.uk>
pkgname=java-nxt
pkgver=1.4.4
maintainer="jpate"
pkgrel=2
pkgdesc="Nite XML Toolkit: A toolkit for providing speech corpora with many layers of annotation"
arch=('any')
url="http://groups.inf.ed.ac.uk/nxt/"
license=('GPL')
depends=( 'java-environment' )
source=(
  nxt_${pkgver}.zip::"http://sourceforge.net/projects/nite/files/nite/nxt_${pkgver}/nxt_${pkgver}.zip/download#"
  nxt
  )
md5sums=('48746dbe0565612056913d6f94eb3f16'
         '69ef4807ccf39930580262a1ea6e4662')
         sha1sums=('e10a67df7b5f841855edd69535b2df7851e6028d'
                   '5a8a8709566850a357ff6d7b886ee8e58946a9cb')

build() {
  cd $srcdir

  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/nxt/

  cp -r "$srcdir"/lib/* "$pkgdir"/usr/share/nxt/

  install -Dm755 nxt "$pkgdir"/usr/bin/

}

