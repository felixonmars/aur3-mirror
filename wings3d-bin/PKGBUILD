# Contributor: Filipp Andjelo <scorp@mailueberfall.de>

pkgname=wings3d-bin
_pkgname=wings
pkgver=1.4.1
pkgrel=1
pkgdesc="Subdivision 3D modeler inspired by Nendo and Mirai from Izware"
arch=('i686' 'x86_64')
url="http://www.wings3d.com"
license=('GPL')
install=wings.install
source=(http://downloads.sourceforge.net/project/wings/wings/${pkgver}/${_pkgname}-${pkgver}-linux.bzip2.run.gz
        wings.desktop wings.png wings.install)

build() {
  cd ${srcdir}

  # Unpack binary installer
  zcat ./${_pkgname}-${pkgver}-linux.bzip2.run.gz > /dev/null
  chmod +x ./${_pkgname}-${pkgver}-linux.bzip2.run
  ./${_pkgname}-${pkgver}-linux.bzip2.run --noexec --target ./${pkgname}-${pkgver}
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  sed -i 's|^INSTALL_DIR=.*$|INSTALL_DIR="$1"|' install_wings
  sed -i 's|ROOTDIR=%ROOTDIR%|ROOTDIR=/usr/share/wings|' install_wings
  
  ./install_wings ${pkgdir}/usr/share/wings
  install -d ${pkgdir}/usr/{bin,share/licenses/wings}
  install -D -m644 ${srcdir}/wings.desktop ${pkgdir}/usr/share/applications/wings.desktop
  install -D -m644 ${srcdir}/wings.png ${pkgdir}/usr/share/pixmaps/wings.png
  mv ${pkgdir}/usr/share/wings/wings ${pkgdir}/usr/bin/wings
  mv ${pkgdir}/usr/share/wings/license.terms ${pkgdir}/usr/share/licenses/wings/license.terms
}

md5sums=('60732474afb3daa5646a06fff91f520b'
         '5d27a114599aea3a245e828594173614'
         '150ee5b1b9b44e20862210c9b01e53f4'
         '3373c814813502060214107e7e616be7')
