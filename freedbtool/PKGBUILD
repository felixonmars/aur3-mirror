# Contributor: Eivind Eide <xenofil A-T gmail D-O-T com>
pkgname="freedbtool"
pkgver="1.14"
pkgrel="1"
pkgdesc="A Python command line tool to access the gnudb.org database"
arch=('i686' 'x86_64')
url="http://muth.org/Robert/Freedbtool"
license="GPL3"
depends=('python2')
source="${url}/${pkgname}.${pkgver}.tar.gz"
md5sums=('5b01c5700baa7d75f528aaf7c4d6c7a6')

build() {
  cd "${srcdir}/Freedbtool"
  sed "1s/python$/python2/" -i discid.py -i gen_toc.py -i freedbtool.py
}

package() { 
  cd "${srcdir}/Freedbtool"
  install -Dm755 discid.py "${pkgdir}/usr/bin/discid.py"
  install -Dm755 gen_toc.py "${pkgdir}/usr/bin/gen_toc.py"
  install -Dm755 freedbtool.py "${pkgdir}/usr/bin/freedbtool.py"
  install -Dm644 00copying \
  "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 00readme \
  "${pkgdir}/usr/share/doc/${pkgname}/README"
}

