# Maintainer: Keith Hughitt <khughitt@umd.edu>
# Contributor: Ben Booth <benwbooth@gmail.com>
pkgname=repeatmodeler
pkgver=1.0.8
pkgrel=1
pkgdesc="RepeatModeler - De-novo repeat family identification and modeling"
arch=('i686' 'x86_64')
url="http://www.repeatmasker.org/RepeatModeler.html"
license=('OSL-2.1')
depends=('perl' 'repeatmasker' 'recon' 'repeatscout' 'trf' 'rmblast')
options=(!emptydirs)
source=("http://www.repeatmasker.org/RepeatModeler-open-1-0-8.tar.gz")
md5sums=('4da961a7af0bdc181814ea7216fd4609')
install='repeatmodeler.install'

package() {
  cd "$srcdir"/RepeatModeler
  install -d "${pkgdir}"/usr/share/licenses/repeatmodeler
  install -D -m644 license.txt "${pkgdir}"/usr/share/licenses/repeatmodeler/LICENSE

  install -d "${pkgdir}"/usr/lib/RepeatModeler
  find . -type d -exec install -d "${pkgdir}"/usr/lib/RepeatModeler/'{}' \;
  find . -type f \! -executable -exec install -D -m644 '{}' "${pkgdir}"/usr/lib/RepeatModeler/'{}' \;
  find . -type f -executable -exec install -D -m755 '{}' "${pkgdir}"/usr/lib/RepeatModeler/'{}' \;

  install -d "${pkgdir}"/usr/bin
  ln -sf /usr/lib/RepeatModeler/RepeatModeler "${pkgdir}"/usr/bin/RepeatModeler
}

