# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: soeren <nonick@posteo.de>

pkgname=unafold
pkgver=3.8
pkgrel=2
pkgdesc="A package for performing energy minimization and partition function calculations on nucleic acid sequences"
arch=('i686' 'x86_64')
url="http://mfold.rna.albany.edu/"
license=('custom')
depends=('freeglut' 'gd' 'gnuplot' 'perl')
source=("http://mfold.rna.albany.edu/cgi-bin/UNAFold-download.cgi?${pkgname}-${pkgver}.tar.bz2")
md5sums=('4458a92de7b26391fc67a30a5246e576')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
