# Contributor: bender02 at archlinux dot us
pkgname=latexdiff
pkgver=1.0.3
pkgrel=1
pkgdesc="A Perl script which acts as a diff for LaTeX files."
url="http://www.ctan.org/tex-archive/support/latexdiff/"
license=("GPL3")
arch=('any')
depends=('perl>=5.8')
source=('http://dante.ctan.org/tex-archive/support/latexdiff.zip')
md5sums=('8cdf86a504513b27c79e1d52b2a9567d')

package() {
  cd "$srcdir/latexdiff"
  install -d -m755 "$pkgdir/usr/bin" "$pkgdir/usr/man/man1"
  install -m755 latexdiff-vc latexdiff-fast latexrevise "$pkgdir/usr/bin"
  install -m755 latexdiff-so "$pkgdir/usr/bin/latexdiff"
  install -m644 latexdiff.1 latexrevise.1 "$pkgdir/usr/man/man1"
}
