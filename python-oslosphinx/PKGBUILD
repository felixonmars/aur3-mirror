# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

pkgbase=python-oslosphinx
pkgname=("python-oslosphinx" "python2-oslosphinx")
_pypiname=oslosphinx
pkgver=2.2.0.0a1
pkgrel=1
pkgdesc="OpenStack Sphinx Extensions and Theme"
arch=(any)
url="https://pypi.python.org/pypi/oslosphinx"
license=('Apache')
makedepends=('python-pip' 'python2-pip')
options=(!emptydirs)
source=("https://pypi.python.org/packages/py2.py3/o/oslosphinx/$_pypiname-$pkgver-py2.py3-none-any.whl")
noextract=("$_pypiname-$pkgver-py2.py3-none-any.whl")
md5sums=('f974b748db49e2aa75b810352a6b8b97')

package_python-oslosphinx() {
  depends=('python')
  replaces=('python-oslo-sphinx')

  cd "${srcdir}"
  /usr/bin/pip install --root="$pkgdir/" "$_pypiname-$pkgver-py2.py3-none-any.whl"
}

package_python2-oslosphinx() {
  depends=('python2')
  replaces=('python2-oslo-sphinx')

  cd "${srcdir}"
  /usr/bin/pip2 install --root="$pkgdir/" "$_pypiname-$pkgver-py2.py3-none-any.whl"
}

# vim:set ts=2 sw=2 et:
