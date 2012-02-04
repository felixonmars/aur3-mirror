# Maintainer: Mike Shutlar (iFSS) <mike at epinux(dot)co(dot)uk>
# Python File Format Interface (PyFFI)
# Can be used with PyPy - comment out Python 2.7 install, uncomment PyPy 1.6 install
pkgname=pyffi
_pkgnamecase=PyFFI
pkgver=2.1.10
pkgrel=1
pkgdesc="Library and editor (QSkope) for block structured binaries (nif,kfm,cgf,egm,dds,tga)"
arch=('any')
url="http://pyffi.sourceforge.net/"
license=('custom:BSD')
groups=('niftools')
depends=('python2-pyqt' 'wine<=1.3.28')
#depends=('python2-pyqt' 'wine<=1.3.28' 'pypy')
source=("http://downloads.sourceforge.net/project/pyffi/pyffi/${pkgver}/PyFFI-${pkgver}.2c30444.tar.bz2")
sha256sums=('26473dbbdb90570e3c818d16f1efe0a790f63fd3a0f1fb234c0b3759a2be9a70')
md5sums=('0e2fbd6942d75b0f51c836fd25c44f2d')

build() {
  # Wine must be used to load mopper.exe (Wine 1.3.30 does not work, try earlier)
  sed -i "s/subprocess.call(\[mopper/subprocess.call(\[\"\/usr\/bin\/wine\", mopper/" \
	  "${srcdir}/${_pkgnamecase}-${pkgver}/pyffi/utils/mopp.py"
}

package() {
  cd "${srcdir}/${_pkgnamecase}-${pkgver}"

  # --- Python 2.7 install
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  chmod +x "${pkgdir}/usr/lib/python2.7/site-packages/pyffi/utils/mopper.exe"
  # --- End Python 2.7 install

  # --- PyPy 1.6 install
  #pypy setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  #install -dm755 "$pkgdir/opt/pypy/"
  #mv "$pkgdir/usr/site-packages" "$pkgdir/opt/pypy/"
  #chmod +x "$pkgdir/opt/pypy/site-packages/pyffi/utils/mopper.exe"
  # --- End PyPy 1.6 install

  install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
}