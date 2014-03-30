# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Tianjiao Yin <ytj000+AUR@gmail.com>

pkgname=python-pyflakes
_reponame=pyflakes
pkgver=0.8
pkgrel=1
pkgdesc='A lint-like tool for Python to identify common errors quickly without executing code'
arch=('any')
url='http://pypi.python.org/pypi/pyflakes'
license=('MIT')
depends=('python')
source=("http://pypi.python.org/packages/source/p/pyflakes/${_reponame}-${pkgver}.tar.gz")
sha1sums=('801c9ad6bddc95e436b103a8deefbfe0f4451f50')

build() {
  cd "${_reponame}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_reponame}-${pkgver}"

  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  mv "${pkgdir}/usr/bin/pyflakes" "${pkgdir}/usr/bin/pyflakes3k"
}
