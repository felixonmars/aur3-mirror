# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname="python2-pyteomics.pepxmltk"
pkgver=0.2.2
pkgrel=1
pkgdesc='Convert X!Tandem XML files to pepXML, create pepXML from Python, run X!Tandem from Python and command line'
arch=('any')
url="https://pypi.python2.org/pypi/pyteomics.pepxmltk"
license=('Apache')
depends=('python2')
optdepends=('xtandem: the X!Tandem search engine (for runtandem)'
            'python2-pyteomics: for pepxmltk functionality'
            'python2-jinja: for pepxmltk functionality')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/pyteomics.pepxmltk/pyteomics.pepxmltk-${pkgver}.tar.gz")
install=pepxmltk.install
md5sums=('df99555828b616063d7d56d7539da7ed')
package() {
  cd "${srcdir}/pyteomics.pepxmltk-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
