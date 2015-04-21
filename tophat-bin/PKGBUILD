# Maintainer:  Mike Dacre <mike.dacre@gmail.com>
# Contributor: decryptedepsilon <decrypted.espsilon at gmail dot com>
pkgname=tophat-bin
pkgver=2.0.14
pkgrel=2
pkgdesc="A fast splice junction mapper for RNA-Seq reads. x86_64 binaries"
arch=('x86_64')
license=('PerlArtistic')
url="http://tophat.cbcb.umd.edu"
depends=('python2')
provides=('tophat')
conflicts=('tophat')
pkgfullname="tophat-$pkgver.Linux_x86_64"
source=("http://ccb.jhu.edu/software/tophat/downloads/$pkgfullname.tar.gz")
sha512sums=('e0d808966890973ecbfe6ff2a6f871a61b14d3c265203da9c31c4895058a1efaf3f0ff2c4184e987ae71307a21b08d558313ec68ed3e26fc338f22da565a5fbd')

prepare() {
  cd "$srcdir/$pkgfullname"
  python_files="bed_to_juncs contig_to_chr_coords sra_to_solid tophat tophat-fusion-post"
  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" $python_files
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  find "$srcdir/$pkgfullname" -type f -executable -exec cp {} "$pkgdir/usr/bin" \;
}
