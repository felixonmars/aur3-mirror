# Maintainer: Cam Webb <cam_webb@yahoo.com>

pkgname=phylocom
pkgver=4.2
pkgrel=1
pkgdesc="Calculates metrics of phylogenetic and phenotypic community structure"
arch=('any')
url="http://phylodiversity.net/phylocom/"
license=('BSD')

build() {
  cd "$srcdir/"
  git clone https://github.com/phylocom/phylocom.git
  cd phylocom/src
  make

  cd ../doc
  curl http://phylodiversity.net/phylocom/phylocom_manual.pdf > phylocom_manual.pdf
}

package() {
  # Executables
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/phylocom/src/phylocom $pkgdir/usr/bin
  cp $srcdir/phylocom/src/phylomatic $pkgdir/usr/bin
  cp $srcdir/phylocom/src/ecovolve $pkgdir/usr/bin

  # documentation, etc
  mkdir -p $pkgdir/usr/share/phylocom/doc   # {doc,example_data,tools}
  cp $srcdir/phylocom/doc/phylocom_manual*.pdf $pkgdir/usr/share/phylocom/doc
  cp -r $srcdir/phylocom/example_data $pkgdir/usr/share/phylocom
  cp -r $srcdir/phylocom/tools $pkgdir/usr/share/phylocom		
}
