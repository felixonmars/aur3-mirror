# Contributor: Carmen <carmen@algofacil.info>

pkgname=wings-bin
_pkgname=wings
pkgver=1.5.3
pkgrel=1
pkgdesc="Subdivision 3D modeler inspired by Nendo and Mirai from Izware"
arch=('i686' 'x86_64')
url="http://www.wings3d.com"
license=('custom')
makedepends=(gzip)
install=wings.install
source=(http://sourceforge.net/projects/wings/files/wings/1.5.3/wings-1.5.3-linux.bzip2.run
        wings.desktop wings.png wings.install)

package() {
  cd ${srcdir}

  # Unpack binary installer
#  zcat ./${_pkgname}-${pkgver}-linux.bzip2.run.gz > /dev/null
  chmod +x ./${_pkgname}-${pkgver}-linux.bzip2.run
  ./${_pkgname}-${pkgver}-linux.bzip2.run --noexec --target ./temp

  # Install files
  cd ${srcdir}/temp
  sed -i 's|^INSTALL_DIR=.*$|INSTALL_DIR="$1"|' install_wings
  sed -i 's|ROOTDIR=%ROOTDIR%|ROOTDIR=/usr/share/wings|' install_wings
  ./install_wings ${pkgdir}/usr/share/wings
  install -D -m755 ${pkgdir}/usr/share/wings/wings ${pkgdir}/usr/bin/wings
  install -D -m644 ${pkgdir}/usr/share/wings/license.terms ${pkgdir}/usr/share/licenses/wings/license.terms
  install -D -m644 ${srcdir}/wings.desktop ${pkgdir}/usr/share/applications/wings.desktop
  install -D -m644 ${srcdir}/wings.png ${pkgdir}/usr/share/pixmaps/wings.png

  # Cleanup
  rm ${pkgdir}/usr/share/wings/{wings,license.terms}
}

md5sums=('bc27a780c9d3c8457c67e824e9a80fe9'
         '5d27a114599aea3a245e828594173614'
        '150ee5b1b9b44e20862210c9b01e53f4'
        'fe97a01e5f683b08eb8079120117d94e')
