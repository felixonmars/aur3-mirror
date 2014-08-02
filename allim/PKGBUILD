# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Mike Dacre <mike.dacre@gmail.com
pkgname=allim
pkgver=1.1  
pkgrel=1
pkgdesc="A tool for measuring allele specific gene expression from the Schlötterer lab in Vienna"
arch=('any')
url="https://code.google.com/p/allim/"
license=('GPL')
depends=('python2' 'python2-biopython' 'python2-numpy' 'python2-rpy2' 
         'samtools' 'picard-tools' 'bedtools' 'gmap-gsnap' 'r' 'python2-rpy2')
install="allim.install"
source=("https://allim.googlecode.com/files/Allim_1.1.tar.gz"
        "https://allim.googlecode.com/files/Allim-Manual.pdf"
        "allim.install"
        "allim.patch")
md5sums=('1c594e22a69e6638a43d43de01549471'
         'dbc22febf78529a439663801678b4323'
         '071cd4f37ab5c614b95935d4696f609e'
         '5a271a24f4a34fd545539bed44e8ec55')

prepare() {
  cd "$srcdir/Allim_$pkgver"
  patch -p1 < "$srcdir/allim.patch" >/dev/null
  find . -exec perl -pi -e 's#/usr/bin/python#/usr/bin/env python2#' {} \; 2>/dev/null
  find . -exec perl -pi -e 's# classes\.# allim_classes\.#' {} \; 2>/dev/null
  find . -exec perl -pi -e 's#\tclasses\.#\tallim_classes\.#' {} \; 2>/dev/null
  find . -exec perl -pi -e 's#import classes#import allim_classes#' {} \; 2>/dev/null
  find . -exec perl -pi -e 's#from classes import#from allim_classes import#' {} \; 2>/dev/null
  cores=$(nproc)
  perl -pi -e "s/^THREAD = 22/THREAD = $cores/" AllimOptions_2Pexpr
  perl -pi -e "s/^THREAD = 22/THREAD = $cores/" AllimOptions_2Pgenomes
  rm -rf classes/.svn
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/allim"
  mkdir -p "$pkgdir/usr/lib/python2.7/site-packages/allim_classes"
  cp "$srcdir/Allim_$pkgver/Allim.py" "$pkgdir/usr/bin/allim.py"
  cp -r "$srcdir/Allim_$pkgver/classes/"* "$pkgdir/usr/lib/python2.7/site-packages/allim_classes/"
  cp "$srcdir/Allim_$pkgver/AllimOptions_"* "$pkgdir/usr/share/allim/"
  cp "$srcdir/Allim-Manual.pdf" "$pkgdir/usr/share/allim/"
  cd "$pkgdir/usr/bin"
  ln -s allim.py allim
}
