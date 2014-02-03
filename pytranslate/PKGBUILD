# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>
pkgname=pytranslate
url="https://github.com/Chipsterjulien/pytranslate"
pkgver=0.1
pkgrel=4
pkgdesc="Translate one or many word(s) with google translate"
arch=('any')
license=('WTFPL')
depends=(python python-requests python-beautifulsoup4)
source=($pkgname-$pkgver.tar.gz)
md5sums=('930a483831d5b3870e847d12db8c015e')

package()
{
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
