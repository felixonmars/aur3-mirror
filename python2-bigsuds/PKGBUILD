pkgname=python2-bigsuds
pkgver=1.0
pkgrel=1
pkgdesc="Library for F5 Networks iControl API"
arch=('any')
url="https://devcentral.f5.com/articles/getting-started-with-bigsuds-ndasha-new-python-library-for-icontrol"
license=('custom')
depends=('python2' 'python2-suds')
source=('https://devcentral.f5.com/labs/pycontrol/bigsuds-1.0.tar.gz')
md5sums=('1d2687bd03f4fd201ba90a8aa44f3b05')

package() {
  cd "$srcdir/bigsuds-1.0.1"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
