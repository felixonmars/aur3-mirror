# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python2-social-auth
pkgver=0.2.2
pkgrel=1
pkgdesc='Python social authentication made simple'
license=('BSD')
arch=('x86_64' 'i686')
url='https://github.com/omab/python-social-auth'
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/p/python-social-auth/python-social-auth-${pkgver}.tar.gz")
sha512sums=('39a685acf3a420a7a8dbcceb5dbcedba4176f7b9708d2f7ad6210aefc4db04cb52508c3cc7406fd156bcb0207bcf16e4043517544ee7a388d427259b971f2690')

package() {
  cd "python-social-auth-0.2.2"
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
