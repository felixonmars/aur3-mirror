# Maintainer: smradlev <smradlev@>

pkgname=python2-fftw-git
_py_pkgname=pyFFTW # The pypi package name
pkgver=20140626
pkgrel=1
pkgdesc="A pythonic wrapper around FFTW"
arch=('i686' 'x86_64')
url="http://hgomersall.github.com/pyFFTW/"
license=('BSD')
depends=('python2-numpy' 'fftw' 'python>=2.7')
options=(!emptydirs)
source=("git://github.com/hgomersall/pyFFTW.git")

md5sums=("SKIP")

pkgver() {
    cd "${_gitname}"
    #git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_py_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
