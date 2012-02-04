# Contributor: Christoph Drexler <chrdr(at)gmx(dot)at>
pkgname=txt2pho
pkgver=0.9.4
pkgrel=2
pkgdesc="A TTS front end for the German inventories of the MBROLA phoneme-to-audio converter."
arch=('i686' 'x86_64')
url="http://www.ikp.uni-bonn.de/forschung/phonetik/sprachsynthese/txt2pho"
license=(custom)
depends=(mbrola)
source=(http://storage.sk.uni-bonn.de/${pkgname}/${pkgname}.zip)
md5sums=('37fc21f71865525105f864967b64f007')

build() {
  cd ${pkgdir}
  mkdir -p etc usr/bin
  mkdir -p usr/share/${pkgname} usr/share/preproc
  mkdir -p usr/share/doc/${pkgname} usr/share/doc/preproc
  mkdir -p usr/share/licenses/${pkgname}
  cd ${srcdir}/${pkgname}
  install ${pkgname} pipefilt/pipefilt preproc/preproc ${pkgdir}/usr/bin/
  install README ${pkgdir}/usr/share/doc/${pkgname}/
  install txt2phorc ${pkgdir}/etc/txt2pho
  sed -i 's|/home/tpo/txt2pho/data/|/usr/share/txt2pho/data/|' ${pkgdir}/etc/txt2pho
  mkdir -p ${pkgdir}/usr/share/${pkgname}/
  cp -r data ${pkgdir}/usr/share/${pkgname}/
  cp -r demo ${pkgdir}/usr/share/${pkgname}/
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
  sed -n -e '/^LICENSE/,/========.*/p' README > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  chmod 0644 ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd preproc
  install Rules.lst Hadifix.abk ${pkgdir}/usr/share/preproc/
  install MANUAL ${pkgdir}/usr/share/doc/preproc/MANUAL
}
