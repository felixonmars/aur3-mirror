# Maintainer: Mike Dacre <mike.dacre@gmail.com>
pkgname=star_rna-seq
pkgver=2.4.1c
pkgrel=1
pkgdesc="RNA-seq spliced transcripts alignment to a reference"
arch=('x86_64' 'i686')
url="https://github.com/alexdobin/STAR"
license=('GPL')
groups=('science' 'alignment')
depends=('samtools')
provides=('STAR')
source=("https://github.com/alexdobin/STAR/archive/STAR_$pkgver.tar.gz")

        md5sums=('0870f2ed9f2415579027e394f4dc0ce8')

# prepare() {
  # cd "$srcdir/STAR-STAR_$pkgver/source"
  # patch Transcriptome_quantAlign.cpp < "$srcdir/Transcriptome_quantAlign.patch"
# }

build() {
  cd "$srcdir/STAR-STAR_$pkgver/source"
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses/star"
  mkdir -p "$pkgdir/usr/share/star"
  install -m755 "$srcdir/STAR-STAR_$pkgver/source/STAR" "$pkgdir/usr/bin/STAR"
  install -m644 "$srcdir/STAR-STAR_$pkgver/LICENSE" "$pkgdir/usr/share/licenses/star/LICENSE"
  install -m644 "$srcdir/STAR-STAR_$pkgver/doc/STARmanual.pdf" "$pkgdir/usr/share/star/STARmanual.pdf"
  cd "$pkgdir/usr/bin"
}
