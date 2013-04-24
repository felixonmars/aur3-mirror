# Contributor: Juergen Hoetzel <juergen@hoetzel.info>
# Contributor: Joerie de Gram <j.de.gram@gmail.com>
pkgname=silvercity
pkgver=0.9.7
pkgrel=1
pkgdesc="A lexical analyser for many languages"
arch=('i686')
url="http://silvercity.sourceforge.net/"
license=('BSD')
depends=('python2')
source=(http://sourceforge.net/projects/silvercity/files/Python%20SilverCity%20Bindings/$pkgver/SilverCity-$pkgver.tar.gz)
md5sums=('4ae4f9691798385dbde3df9cbb228e8c')


build() {
  cd $srcdir/SilverCity-$pkgver

  python2 setup.py build
}

package() {
  cd $srcdir/SilverCity-$pkgver
  
  python2 setup.py install --root=$pkgdir
  
  # fix path and python version
  sed -e 's|#!/usr/home/sweetapp/bin/python|#!/usr/bin/env python2|' -i $pkgdir/usr/bin/cgi-styler-form.py
  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' -i $pkgdir/usr/bin/cgi-styler.py
  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' -i $pkgdir/usr/bin/source2html.py

  # fix CR/LF issue
  find $pkgdir/usr/bin -name "*.py" -exec sed -e '1s/\r$//' -i \{\} \;

  # license
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname
}
