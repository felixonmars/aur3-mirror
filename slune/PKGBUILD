# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Patrik Ilg <p.ilg@arcor.de>

pkgname=slune
pkgver=1.0.15
pkgrel=2
pkgdesc="A 3D racing and car-crashing game written in Python"
arch=('any')
url="http://home.gna.org/oomadness/en/slune/"
license=('GPL')
depends=('cal3d' 'glew' 'py2play' 'pyogg' 'python2' \
         'python-opengl' 'python-soya' 'pyvorbis' 'sdl')
source=("http://download.gna.org/slune/Slune-${pkgver}.tar.bz2"
        "${pkgname}.desktop")
md5sums=('100cf5ccda0b7fe38065a8b83dde82ab'
         '00c1bc4c159e8a985d3435b719348635')

build() {
  cd "${srcdir}/Slune-${pkgver}"
  sed -i "s_/usr/bin/python_/usr/bin/python2_" *.py
  python2 setup.py build || return 1
}

package() {
  cd "${srcdir}/Slune-${pkgver}"
  python2 setup.py install --root="${pkgdir}" || return 1

  # Move Slune-1.0.15-py2.7.egg-info to the right place
  mkdir -p "${pkgdir}/usr/lib/python2.7/site-packages"
  mv "${pkgdir}/usr/share/"*.egg-info "${pkgdir}/usr/lib/python2.7/site-packages"

  # Install pixmap and .desktop file
  install -Dm644 "images/${pkgname}.48.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install man page and documentation
  install -Dm644 "manpage/man6/${pkgname}.6" "${pkgdir}/usr/share/man/man6/${pkgname}.6"
  install -Dm644 manual.fr.pdf "${pkgdir}/usr/share/doc/${pkgname}/manual.fr.pdf"
}
