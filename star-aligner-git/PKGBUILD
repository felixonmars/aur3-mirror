# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=star-aligner-git
pkgver=2.4.0g1
pkgrel=1
pkgdesc="Spliced Transcripts Alignment to a Refereence Genome"
arch=('x86_64')
url="https://github.com/alexdobin/STAR"
makedepends=('git')
license=('GPL')

build(){
  cd $srcdir
  git clone https://github.com/alexdobin/STAR.git
  cd STAR/source
  make STAR
}

package() {
  install -D -m755 "${srcdir}/STAR/source/STAR" "${pkgdir}/usr/bin/STAR"
}

