# Maintainer: domanov @ gmail
pkgname=python-phreeqpy
_realname=phreeqpy
pkgver=0.1
pkgrel=1
pkgdesc="Python bindings to use with iphreeqc"
arch=('i686' 'x86_64')
url="http://www.phreeqpy.com/"
license=('unknown')
groups=()
depends=('python' 'iphreeqc')
makedepends=()
provides=()
options=(!emptydirs)
source=("http://www.phreeqpy.com/download/${_realname}${pkgver}.zip"
	arch.patch)
md5sums=('ab7d2aea478de6a5abd874a16beffdd0'
         '7903551150fae83a31f8bb84ceaf9406')

package() {
  cd "$srcdir"/
  patch -p0 < arch.patch
  cd "${_realname}${pkgver}"
  rm -rf phreeqpy/iphreeqc/IPhreeqc.dll
  rm -rf phreeqpy/iphreeqc/libiphreeqc.so.0.0.0
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
