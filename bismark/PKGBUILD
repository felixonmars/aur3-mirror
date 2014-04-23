# Maintainer: Cory Giles <mail@corygil.es>

pkgname=bismark
pkgver=0.11.1
pkgrel=1
pkgdesc="A tool to map bisulfite converted sequence reads and determine cytosine methylation states."
arch=('any')
url="http://www.bioinformatics.babraham.ac.uk/projects/bismark/"
license=('GPL3')
depends=('perl')
optdepends=('bowtie' 'bowtie2')
source=(http://www.bioinformatics.babraham.ac.uk/projects/$pkgname/${pkgname}_v${pkgver}.tar.gz)
md5sums=('fdb7545f2c61c73f289b2106876f8e46')

package() {
	cd "$srcdir/${pkgname}_v${pkgver}"
    mkdir -p $pkgdir/usr/bin
    find -executable -exec cp {} $pkgdir/usr/bin \;
}
