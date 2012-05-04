# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Eric Forgeot <http://anamnese.online.fr>

pkgname=pyhalebarde
pkgver=0.3
pkgrel=1
pkgdesc="An adaptation of the Halebarde et Gonfanon board game"
arch=('any')
url="https://code.launchpad.net/pyhalebarde"
license=('GPL')
depends=('pyclutter-gtk' 'python-pygame' 'python-simplejson' 'python-telepathy')
makedepends=('python-docutils')
source=("https://launchpad.net/${pkgname}/${pkgver}/clutter/+download/${pkgname}-${pkgver}.tar.gz"
        "00-boardwidget.patch"
        "01-desktop.patch")
md5sums=('cf1a897ce99d2e4cd8d5e6c46f92ac61'
         'cea2f5285bbc4c269e3fca0650224739'
         '9ea73bca3c2cbd31be7a8a6ebc295195')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fix compatibility with Python 2
  sed -i "s_/usr/bin/python_&2_" halebarde/*.py pyhalebarde

  # Fix installation paths
  sed -i "s_share/games_share_" halebarde/*.py setup.py
  sed -i "s_games_bin_" setup.py
  sed -i "s_@bindir@_/usr/bin_" data/*.service.in

  # Apply a patch to fix compatibility with Clutter 1.x
  # https://code.launchpad.net/~olethanh/pyhalebarde/clutter1
  patch -Np1 -i ../00-boardwidget.patch

  # Apply a patch to fix desktop entry warnings
  patch -Np1 -i ../01-desktop.patch

  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 setup.py install --root="${pkgdir}"

  # Fix a library error (perhaps it should be done in another package?)
  ln -s /usr/lib/libcogl.so "${pkgdir}/usr/lib/libcogl.so.5"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS CONTRIBUTORS NEWS README "${pkgdir}/usr/share/doc/${pkgname}"
}
