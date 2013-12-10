# Maintainer: yescalona <yescalona'@'ug'.'uchile'.'cl>

pkgname=weblogo
pkgver=3.3
pkgrel=1
pkgdesc="Generator of sequence logos"
arch=('any')
url="http://weblogo.threeplusone.com/"
license=('BSD')
depends=('python2' 'python2-numpy')
makedepends=('')
source=(http://weblogo.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('2f56fd9996e7a37c7b430ac67b3002bf')

package() {
  cd $srcdir/${pkgname}-${pkgver}
  sed -i '210d' weblogolib/__init__.py #remove the -dPDFSETTINGS=/printer
  python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
