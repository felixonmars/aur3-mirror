# Developped by Heng LI (cf http://en.wikipedia.org/wiki/Heng_Li) at the Broad Institute, Cambridge, MA.
# Maintainer: Cyril CROS <cyril.cros@polytechnique.org>

pkgname=seqtk-git
pkgver=r77
pkgrel=2
pkgdesc="A fast and lightweight tool for processing sequences in the FASTA or FASTQ format (especially useful for next-gen sequencing data)."
arch=('any')
url="https://github.com/lh3/seqtk"
license=('MIT')
makedepends=('git')
source=('git+https://github.com/lh3/seqtk')	# No stable branch!
noextract=()
md5sums=('SKIP')

# Using version name rXX (version+git revision)

pkgver() {
	cd "$srcdir/seqtk"
	printf "r%s" "$(git rev-list --count HEAD)"
}

build() {
	cd "$srcdir/seqtk"
	make
}

package() {
	cd "$srcdir/seqtk"
	install -Dm755 seqtk "$pkgdir/usr/bin/seqtk"
	install -Dm755 trimadap "$pkgdir/usr/bin/trimadap"
}

