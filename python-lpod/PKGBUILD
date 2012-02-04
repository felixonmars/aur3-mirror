# Maintainer: Hervé Cauwelier <herve ¤ itaapy.com>
# Published at http://aur.archlinux.org/packages.php?ID=34271

pkgname=python-lpod
pkgver=0.9.2
pkgrel=2
pkgdesc="Languages & Platforms OpenDocument: Python implementation"
arch=('any')
license=('GPL3' 'APACHE2')
url="http://www.lpod-project.org/"
depends=('python-lxml' 'pygobject')
source=("http://download.lpod-project.org/lpod-python/lpod-python-$pkgver.tar.gz")
md5sums=('177ef6152f18385063d443c653c22127')

build() {
  cd "${srcdir}/lpod-python-$pkgver"
  python2 setup.py install --root="${pkgdir}" || return 1
}
