# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-bottle-sqlalchemy
pkgver=0.4
pkgrel=2
pkgdesc="Bottle SQLAlchemy plugin"
arch=(any)
url="https://pypi.python.org/pypi/bottle-sqlalchemy/"
license=('MIT')
depends=('python' 'python-bottle' 'python-sqlalchemy')
makedepends=('python-distribute')
source=("https://pypi.python.org/packages/source/b/bottle-sqlalchemy/bottle-sqlalchemy-${pkgver}.zip")
sha1sums=('9ac5905d4e33d50faa951598f6cb9af2bf7aea3e')

package() {
  cd "${srcdir}/bottle-sqlalchemy-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
