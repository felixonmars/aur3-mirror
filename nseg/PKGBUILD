# Maintainer: Keith Hughitt <khughitt@umd.edu>
pkgname=nseg
pkgver=1
pkgrel=1
pkgdesc="NSEG: NCBI tool for nucleic acid masking used by RepeatScout"
arch=('i686' 'x86_64')
url="ftp://ftp.ncbi.nih.gov/pub/seg/nseg/"
license=('UNKNOWN')
options=(!emptydirs)
source=("ftp://ftp.ncbi.nih.gov/pub/seg/nseg/genwin.c"
        "ftp://ftp.ncbi.nih.gov/pub/seg/nseg/genwin.h"
        "ftp://ftp.ncbi.nih.gov/pub/seg/nseg/lnfac.h"
        "ftp://ftp.ncbi.nih.gov/pub/seg/nseg/makefile"
        "ftp://ftp.ncbi.nih.gov/pub/seg/nseg/nmerge.c"
        "ftp://ftp.ncbi.nih.gov/pub/seg/nseg/nseg.c")

md5sums=('87b7d1fff7541813cb92d196b901edcd'
         '28d33ba886d6a94b630386df1a43063b'
         '953c6bea22ee2d19b1d9bc1f350e5077'
         '07119a2e33277cc5da3f5e83765220f9'
         '2b8021a9dafd4d5ed2e93746dc38bc45'
         '9d564122eed110d496fa3738d6b7bda3')

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  install -D -m644 nseg "${pkgdir}"/bin/nseg
  install -D -m644 nseg "${pkgdir}"/bin/nmerge
}

