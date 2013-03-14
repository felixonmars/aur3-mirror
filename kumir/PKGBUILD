# Maintainer: mrLoki <mat_kit@rambler.ru>
pkgname=kumir
pkgver=1.9.0
pkgrel=1
pkgdesc="An educational programming language and IDE in Russian schools"
url="http://www.niisi.ru/kumir/index.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('qt4')
makedepends=('python2')
source=("http://www.niisi.ru/${pkgname}/${pkgname}-${pkgver}.tar.gz"
    "kumir-1.9.0.patch")
md5sums=('ba9ae098a97224e573ae952280f50eda'
    '888388d62d920082847890f45a059928')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/kumir-1.9.0.patch"
  sed -i -e 's/python\ /python2\ /g' $(find "${srcdir}" -name '*.pro')
  sed -i -e 's/\#\!\/usr\/bin\/python/\#\!\/usr\/bin\/python2/' ${srcdir}/${pkgname}-${pkgver}/Scripts/*.py
  /usr/bin/python2 ./configure.py --prefix="${pkgdir}/usr" --target-dir="${pkgdir}/usr/share/${pkgname}" --qmake=/usr/bin/qmake-qt4
  sed -i -e 's/python\ /python2\ /g' $(find "${srcdir}" -name 'Makefile')
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 Addons/turtle.ini \
      ${pkgdir}/usr/share/${pkgname}/Addons/turtle.ini
  install -Dm644 Addons/vodoley/resources/test.vod \
      ${pkgdir}/usr/share/${pkgname}/Addons/vodoley/resources/test.vod
  sed -i -e "s#${pkgdir}/usr/share/${pkgname}#/usr/share/${pkgname}#g" ${pkgdir}/usr/bin/kum*
}
