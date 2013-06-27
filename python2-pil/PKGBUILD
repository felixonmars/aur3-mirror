# Maintainer: Florian Friesdorf <archlinux@chaoflow.net>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: simo <simo@archlinux.org>

pkgname=python2-pil
pkgver=1.1.7
pkgrel=2
pkgdesc="Python imaging library"
arch=('any')
url="http://www.pythonware.com/products/pil/index.htm"
license=('GPL')
depends=('python2' 'libjpeg' 'freetype2') 
makedepends=('tk>=8.5.0')
optdepends=('tk>=8.5.0')
conflicts=('')
replaces=('')
source=(http://effbot.org/media/downloads/Imaging-${pkgver}.tar.gz)
md5sums=('fc14a54e1ce02a0225be8854bfba478e')

build() {
  cd ${srcdir}/Imaging-${pkgver}
  python2 setup.py build_ext 
  python2 setup.py install --root=${pkgdir}
  mkdir -p ${pkgdir}/usr/include/python2.7/
  cp libImaging/*.h ${pkgdir}/usr/include/python2.7/

  # Install license
  install -m644 -D ${srcdir}/Imaging-${pkgver}/README \
                   ${pkgdir}/usr/share/licenses/${pkgname}/README

  # rename files colliding with non-suffixed version
  echo "Suffixing executables with -py24"
  for x in \
      pilconvert \
      pildriver \
      pilfile \
      pilfont \
      pilprint 
  do
      mv ${pkgdir}/usr/bin/${x}.py ${pkgdir}/usr/bin/${x}-py27.py
  done
}

