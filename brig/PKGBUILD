# Maintainer: florianbw <florian.bw@gmail.com>
# Contributor: florianbw <florian.bw@gmail.com>

pkgname=brig
pkgver=0.95
pkgrel=1
pkgdesc='BLAST Ring Image Generator (brig) is a cross-platform application that can display circular comparisons between a large number of genomes, with a focus on handling genome assembly data.'
arch=('any')
url=http://brig.sourceforge.net/
license=('GPL3')
depends=('java-runtime-common')
source=("http://downloads.sourceforge.net/project/brig/BRIG-${pkgver}-dist.zip" \
        "brig" \
        "brig.sh" )

package() {
  install -d ${pkgdir}/opt/brig
  install -d ${pkgdir}/usr/bin

  cp -r ${srcdir}/BRIG-${pkgver}-dist/* ${pkgdir}/opt/brig
  install -D -m755 brig.sh ${pkgdir}/opt/brig/
  install -D -m755 brig ${pkgdir}/usr/bin/
  chmod 755 ${pkgdir}/opt/brig/brig.sh 
}

# vim:set ts=2 sw=2 et:
md5sums=('3b5e83aba83b48bc3dc78591e0cff814'
         '9a967413eddd2bba3527d7378b50255b'
         'b48e07f9b9eef08810e8982e98a92bd1')
