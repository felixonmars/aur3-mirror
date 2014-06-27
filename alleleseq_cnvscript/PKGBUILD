# Install CNVnator from the Gernstein lab

# Maintainer: Mike Dacre <mike.dacre@gmail.com>
pkgname=alleleseq_cnvscript
pkgver=v0.3
pkgrel=1
pkgdesc="Installs the Gernstein lab's CNV script. Requires source code modification to alleleWrap_2a_cnvnator_rd.sh"
arch=('x86_64' 'i386')
url="http://alleleseq.gersteinlab.org/tools.html"
license=('CCPL' 'cc-by-nd-3.0')
depends=('cnvnator')
source=('http://alleleseq.gersteinlab.org/alleleSeq_cnvScript.zip'
        'makefile.patch.xz')
md5sums=('0d1ae6974d6b6a17ef332b9182b46e21'
         '3259dddb6a2e456c89b83256ed472411')
 
prepare() {
  cd "$srcdir/alleleSeq_cnvScript/"
  patch < "$srcdir/makefile.patch"
}

build() {
  cd "$srcdir/alleleSeq_cnvScript/"
  make addCNV
  make addRD
}

package() {
  mkdir -p "$pkgdir/bin/"
  cp "$srcdir/alleleSeq_cnvScript/addCNV" "$pkgdir/bin/"
  cp "$srcdir/alleleSeq_cnvScript/addRD" "$pkgdir/bin/"
  cp "$srcdir/alleleSeq_cnvScript/alleleWrap_2a_cnvnator_rd.sh" "$pkgdir/bin/"
}
