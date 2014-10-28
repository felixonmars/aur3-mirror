# Maintainer: Alessandro Pezzoni <alessandro dot pezzoni at runbox dot com>
pkgname=python2-termrecord
_name=TermRecord
pkgver=1.1.3
pkgrel=1
pkgdesc="A simple terminal session recorder with easy-to-share HTML output."
arch=('any')
url="https://github.com/theonewolf/TermRecord"
license=('MIT')
depends=('python2-jinja>=2.6' 'util-linux')
optdepends=('ttyrec: backend alternative to ''script''')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/T/${_name}/${_name}-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('5b2db95c7f7034dad3063e511a65a71d2e293a5dc93f699b9e1ac3ff6e9647a0'
            '2856bd50a13881a1352bc41e726b88dfb68fe0a7dc31067ee43758c1889857b4')

package() {
  cd "$srcdir/${_name}-$pkgver"

  sed -i 's@usr/local/share@usr/share@' ./setup.py
  sed -i 's@usr/local/share@usr/share@' ./src/TermRecord
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
