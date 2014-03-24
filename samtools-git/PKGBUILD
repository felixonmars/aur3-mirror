# Maintainer: Bruno Vieira <mail@bmpvieira.com>

pkgname=samtools-git
pkgver=0.1.19.r64.gbd5f0a0
pkgrel=1
pkgdesc="SAM Tools provide various utilities for manipulating alignments in the SAM format."
arch=('i686' 'x86_64')
url="https://github.com/samtools/samtools"
license=('MIT')
depends=('zlib' 'ncurses')
makedepends=('git')
conflicts=('samtools')
provides=('samtools')
source=("$pkgname"::'git://github.com/samtools/samtools.git#branch=standalone')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 samtools "$pkgdir/usr/bin/samtools"
  install -Dm755 bcftools/bcftools "$pkgdir/usr/bin/bcftools"
  install -Dm755 bcftools/vcfutils.pl "$pkgdir/usr/bin/vcfutils.pl"
  install -Dm755 misc/ace2sam "$pkgdir/usr/bin/ace2sam"
  install -Dm755 misc/bamcheck "$pkgdir/usr/bin/bamcheck"
  install -Dm755 misc/blast2sam.pl "$pkgdir/usr/bin/blast2sam.pl"
  install -Dm755 misc/bowtie2sam.pl "$pkgdir/usr/bin/bowtie2sam.pl"
  install -Dm755 misc/export2sam.pl "$pkgdir/usr/bin/export2sam.pl"
  install -Dm755 misc/interpolate_sam.pl "$pkgdir/usr/bin/interpolate_sam.pl"
  install -Dm755 misc/maq2sam-long "$pkgdir/usr/bin/maq2sam-long"
  install -Dm755 misc/maq2sam-short "$pkgdir/usr/bin/maq2sam-short"
  install -Dm755 misc/md5fa "$pkgdir/usr/bin/md5fa"
  install -Dm755 misc/md5sum-lite "$pkgdir/usr/bin/md5sum-lite"
  install -Dm755 misc/novo2sam.pl "$pkgdir/usr/bin/ovo2sam.pl"
  install -Dm755 misc/plot-bamcheck "$pkgdir/usr/bin/plot-bamcheck"
  install -Dm755 misc/psl2sam.pl "$pkgdir/usr/bin/psl2sam.pl"
  install -Dm755 misc/r2plot.lua "$pkgdir/usr/bin/r2plot.lua"
  install -Dm755 misc/sam2vcf.pl "$pkgdir/usr/bin/sam2vcf.pl"
  install -Dm755 misc/samtools.pl "$pkgdir/usr/bin/samtools.pl"
  install -Dm755 misc/soap2sam.pl "$pkgdir/usr/bin/soap2sam.pl"
  install -Dm755 misc/varfilter.py "$pkgdir/usr/bin/varfilter.py"
  install -Dm755 misc/vcfutils.lua "$pkgdir/usr/bin/vcfutils.lua"
  install -Dm755 misc/wgsim "$pkgdir/usr/bin/wgsim"
  install -Dm755 misc/wgsim_eval.pl "$pkgdir/usr/bin/wgsim_eval.pl"
  install -Dm755 misc/zoom2sam.pl "$pkgdir/usr/bin/zoom2sam.pl"
  install -Dm644 samtools.1 "$pkgdir/usr/share/man/man1/samtools.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
