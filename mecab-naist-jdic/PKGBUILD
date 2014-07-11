# Maintainer: 7kry <kt@7kry.net>

pkgname=mecab-naist-jdic
pkgver=0.6.3b
_date=20111013
pkgrel=1
pkgdesc='NAIST Japanese Dictionary for MeCab'
arch=('i686' 'x86_64')
url='http://naist-jdic.sourceforge.jp/'
license=('custom')
depends=('mecab')
install="${pkgname}.install"
source=(http://dl.sourceforge.jp/naist-jdic/53500/mecab-naist-jdic-${pkgver}-${_date}.tar.gz ${install})
md5sums=('52238fb14d949e49a65a9dbc1f7e382c'
         '412682f911662f810d5a10697eb89ebe')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-${_date}
  ./configure --prefix=/usr --with-charset=utf-8
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-${_date}

  make DESTDIR=${pkgdir} install
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}-${_date}/COPYING \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
