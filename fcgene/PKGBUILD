# Maintainer: Mike Dacre <mike@dacre.me> 0xE76370D6
pkgname=fcgene
pkgver=1.0.7
pkgrel=1
pkgdesc="Interconvert GWAS/genotype file formats. e.g. plink, impute2, snptest, haploview"
arch=('i686' 'x86_64')
url="http://sourceforge.net/p/fcgene/wiki/Genotype%20format%20converting%20tool%20:%20FCgene/"
license=('GPL')
depends=('gcc-libs'
         'zlib')
optdepends=('plink: Read plink files'
            'impute2: Work with .gens files'
            'mach: Work with mach files'
            'snptest: Work with snptest files'
            'beagle: Work with beagle files'
            'bimbam: Work with .geno.txt files')
source=("http://hivelocity.dl.sourceforge.net/project/fcgene/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig")

md5sums=('b73951fa41612c90c3fdda6fab2622f0'
         'SKIP')

validpgpkeys=('E955C0840FDEE708278188E9ADA7B25FE76370D6')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
