# Maintainer: Keith Hughitt <khughitt@umd.edu>
pkgname=repeatscout
pkgver=1.0.5
pkgrel=1
pkgdesc="RepeatScout - De Novo Repeat Finder (Price et al, 2005)"
arch=('i686' 'x86_64')
url="http://repeatscout.bioprojects.org/"
license=('unknown')
depends=('perl')
optdepends=('trf: Filter repeat library to remove low-complexity and tandem sequences (1/2)'
            'nseg: Filter repeat library to remove low-complexity and tandem sequences (2/2)'
            'repeatmasker: Filter repeat library against segmental duplications, exons, and other features')
options=(!emptydirs)

source=("http://repeatscout.bioprojects.org/RepeatScout-${pkgver}.tar.gz")
md5sums=('f6aa56343fd39ffb64e05c03739325b7')

build() {
  cd "$srcdir"/RepeatScout-1
  #sed -i 's/usr\/local/usr/' Makefile
  make
}

package() {
  cd "$srcdir"/RepeatScout-1
  install -d "${pkgdir}"/usr/lib/
  make install INSTDIR=${pkgdir}/usr/lib/RepeatScout

  install -d "${pkgdir}"/usr/bin
  ln -sf /usr/lib/RepeatScout/RepeatScout "${pkgdir}"/usr/bin/RepeatScout
  ln -sf /usr/lib/RepeatScout/build_lmer_table "${pkgdir}"/usr/bin/build_lmer_table
}

