pkgname="python-pyramid-doc"
pkgver=1.5.2
pkgdesc="Documentation for pyramid web framework."
pkgrel=1
arch=('any')
url="http://www.pylonsproject.org/"
license=('custom:BSD')
makedepends=('python')
source=("git+https://github.com/Pylons/pyramid.git#tag=$pkgver"
        "git+https://github.com/Pylons/pylons_sphinx_theme.git")
md5sums=(SKIP SKIP)


prepare() {
  cd pyramid
  git submodule init
  git config submodule.docs/_themes.url $srcdir/pylons_sphinx_theme
  git submodule update
}


build() {
  # Using a python virtualenv because there are just to many python
  # dependencies to create PKGBUILDS for.

  ve="${srcdir}/ve"
  pyvenv "$ve"
  cd "${srcdir}/pyramid"
  source "$ve/bin/activate"
  pip install -e .
  pip install sphinx repoze.sphinx.autointerface 
  cd docs
  make html
}

package() {
  mkdir -p "$pkgdir/usr/share/doc/python-pyramid"
  cp "${srcdir}/pyramid/docs/_build/html" "$pkgdir/usr/share/doc/python-pyramid" -r
}
