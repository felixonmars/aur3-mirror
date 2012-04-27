# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tutku Dalmaz <tutkudalmaz>

pkgname=loosecannon
pkgver=0.5.0
pkgrel=2
pkgdesc="A 3D third-person action-adventure game"
arch=('i686' 'x86_64')
url="http://loose-cannon.sourceforge.net/"
license=('GPL')
depends=('freealut' 'mesa' 'python2' 'sdl_image')
source=("http://downloads.sourceforge.net/loose-cannon/${pkgname}-${pkgver}.tar.gz")
md5sums=('7ec489f393295c88f9ef4b3f9d0d2c52')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s_/usr/bin/python_&2_" "share/${pkgname}/scripts/maze.py"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  mkdir -p "${pkgdir}/usr/share"
  make DESTDIR="${pkgdir}" datadir="${pkgdir}/usr/share" install

  # Fix permissions
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 '{}' \;
  chmod 755 "${pkgdir}/usr/share/${pkgname}/scripts/maze.py"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS ChangeLog README "${pkgdir}/usr/share/doc/${pkgname}"
}
