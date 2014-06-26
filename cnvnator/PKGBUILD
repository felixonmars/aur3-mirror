# Install CNVnator from the Gernstein lab

# Maintainer: Mike Dacre <mike.dacre@gmail.com>
pkgname=cnvnator
pkgver=v0.3
pkgrel=1
pkgdesc="Install CNVnator from the Gerstein lab, including cnvnator2VCF.pl script"
arch=('x86_64')
url="http://sv.gersteinlab.org/cnvnator/"
license=('CCPL' 'cc-by-nd-3.0')
depends=('root' 'vcf2diploid' 'samtools')
source=('http://sv.gersteinlab.org/cnvnator/CNVnator_v0.3.zip'
        'makefile.patch.xz')
md5sums=('006eef9db71f596c97c886a623db4881'
         '98098eb243b7f321a9ebfd46e8738310')
 
prepare() {
  cd "$srcdir/CNVnator_v0.3/src/"
  patch < "$srcdir/makefile.patch"
}

build() {
  cd "$srcdir/CNVnator_v0.3/src/"
  make
}

package() {
  mkdir -p "$pkgdir/bin/"
  cp "$srcdir/CNVnator_v0.3/src/cnvnator" "$pkgdir/bin/"
  cp "$srcdir/CNVnator_v0.3/cnvnator2VCF.pl" "$pkgdir/bin/"
}
