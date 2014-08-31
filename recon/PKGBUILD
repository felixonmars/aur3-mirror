# Maintainer: Keith Hughitt <khughitt@umd.edu>
pkgname=recon
pkgver=1.08
pkgrel=1
pkgdesc="RECON - De Novo Repeat Finder (Bao & Eddy, 2002)"
arch=('i686' 'x86_64')
url="http://www.repeatmasker.org/RepeatModeler.html"
license=('GPL2')
depends=('perl')
options=(!emptydirs)

source=("http://www.repeatmasker.org/RECON-${pkgver}.tar.gz")
md5sums=('48c5c650a312bc1cc3fdddcfd943deb0')

build() {
  cd "$srcdir"/RECON-$pkgver
  sed -i 's/""/"\/bin"/' scripts/recon.pl

  cd src
  make
  make install
}

package() {
  cd "$srcdir"/RECON-$pkgver
  install -d "${pkgdir}"/usr/lib/RECON

  find . -maxdepth 0 -type f -exec install -D -m644 '{}' "${pkgdir}"/usr/lib/RECON/'{}' \;
  find Demos -type f \! -executable -exec install -D -m644 '{}' "${pkgdir}"/usr/lib/RECON/'{}' \;
  find scripts -type f -executable -exec install -D -m755 '{}' "${pkgdir}"/usr/lib/RECON/'{}' \;

  #install -d "${pkgdir}"/bin
  #find bin -type f -executable -exec install -D -m755 '{}' "${pkgdir}" '{}' \;
  find bin -type f -executable -exec install -D -m755 '{}' "${pkgdir}"/'{}' \;

  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

