# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=qualimap
pkgver=2.0.2
pkgrel=1
pkgdesc="Platform independent tool to facilitate the quality control of genomic sequencing data."
arch=('any')
url="http://qualimap.bioinfo.cipf.es/"
license=('GPL')
depends=('java-environment' 'sh' 'r')
source=("https://bitbucket.org/kokonech/qualimap/downloads/qualimap_v${pkgver}.zip")
md5sums=('1656204cbab6a8ae851b3b114c585b27')

package() {
  #Creating folders required
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r $srcdir/$pkgname\_v$pkgver/* ${pkgdir}/opt/${pkgname}
  cd "${pkgdir}/usr/bin/"
  ln -s "../../opt/${pkgname}/${pkgname}"
  sed -i -e '1iOLDDISPLAY=$DISPLAY\' "../../opt/${pkgname}/${pkgname}"
  sed -i -e '2iunset DISPLAY' "../../opt/${pkgname}/${pkgname}"
  sed -i '/export QUALIMAP_HOME/c\export QUALIMAP_HOME="/opt/qualimap/"' "../../opt/${pkgname}/${pkgname}"
  echo "DISPLAY=\$OLDDISPLAY" >> "../../opt/${pkgname}/${pkgname}"
  msg "Execute this to get the R dependencies installed: Rscript /opt/${pkgname}\_v${pkgver}/scripts/installDependencies.r"
}
