# Maintainer: Marc Masdeu <marc.masdeu@gmail.com>
# Author: Eric Finster, from http://curiousreasoning.wordpress.com

pkgname=wplatex
pkgver=0.2
pkgrel=1
pkgdesc="Write WordPress blog entries using standard LaTeX and your favorite editor."
arch=(any)
url="http://people.virginia.edu/~elf9e/wplatex"
source=(http://people.virginia.edu/~elf9e/wplatex/$pkgname-$pkgver.tar.gz)
md5sums=('b09591074120ab8175ba78f5c7681507')
license=('GPL')
depends=('python2' 'texlive-core' 'plastex' 'wordpresslib')
makedepends=()
backup=()
options=(!emptydirs)
install=

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
  mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/base/
  cp -u wpblogentry.cls $pkgdir/usr/share/texmf-dist/tex/latex/base/
  /usr/bin/texhash
}

post_install() {
  echo "  After creating a tex file using the document class  'wpblogentry',"
  echo "upload it to your blog issuing something like:"
  echo "   wplpost -u myname -b myblog foo.tex"
}
