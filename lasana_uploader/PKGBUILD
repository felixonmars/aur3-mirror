# Maintainer: Juan Luis Boya <ntrrgc@gmail.com>
pkgname=lasana_uploader
pkgver=0.1
pkgrel=1
pkgdesc="Upload files to Lasaña from your dekstop"
arch=("any")
url="https://github.com/ntrrgc/lasana_uploader"
license=('2-clause BSD')
depends=('python2'
         'python2-requests'
         'python2-lxml'
         'python2-cssselect'
         'python2-pyqt')
source=("https://github.com/ntrrgc/lasana_uploader/blob/master/dist/lasana_uploader-0.1.tar.gz?raw=true")
md5sums=('567c43bb60e1895db6128a71e20407a4')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
