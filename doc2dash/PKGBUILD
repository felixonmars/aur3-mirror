# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Your Name <youremail@domain.com>
pkgname=doc2dash
pkgver=2.0.2
pkgrel=1
pkgdesc="Convert sphynx/pydoctor documentation to docsets usable by Zeal."
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}"
license=('MIT')

depends=('python-zope-interface'
         'python-six'
         'python-lxml'
         'python-colorama'
         'python-click'
         'python-characteristic'
         'python-beautifulsoup4'
         'python-sphinx')

optdepends=('zeal-git: for viewing docsets')

checkdepends=('python-mock'
              'python-pytest')

options=(!emptydirs)
source=("https://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'dependencies.diff')
sha1sums=('65e41574aaa6fa54a0b0c2e73607ad999b9fcc9d'
          '47cf190ef6640b02be768925a1c4dc6480486c75')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -u < "$srcdir/dependencies.diff"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
