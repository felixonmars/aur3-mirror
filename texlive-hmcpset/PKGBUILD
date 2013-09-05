# Maintainer: Adam Dunlap <dunlapadam@gmail.com>
pkgname=texlive-hmcpset
pkgver=0.5
pkgrel=1
pkgdesc="Harvey Mudd College Mathematics Department homework template"
arch=('any')
license=('unknown')
url=("http://www.math.hmc.edu/computing/support/tex/classes/hmcpset/")
depends=(texlive-core)
install=$pkgname.install
source=("http://www.math.hmc.edu/computing/support/tex/classes/hmcpset/hmcpset-current.tar.gz")
md5sums=('bb664d74d6ab5a5a072046747287fbcd')

package() {
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/hmcpset
  cp $srcdir/hmcpset-0.5/hmcpset.cls $pkgdir/usr/share/texmf/tex/latex/hmcpset
  mkdir -p $pkgdir/usr/share/hmcpset
  cp $srcdir/hmcpset-0.5/hw-* $pkgdir/usr/share/hmcpset
}
