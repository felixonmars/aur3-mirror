# Contributor: eirik
pkgname=linjap
pkgver=2.0.5
pkgrel=1
pkgdesc="Vocabulary study helper for students of Japanese using the GENKI book series."
arch=('i686' 'x86_64')
url="http://linjap.berlios.de/"
license=('GPL3')
depends=('boost' 'gtkmm')
install="${pkgname}.install"
source=(http://download.berlios.de/linjap/$pkgname-$pkgver.tar.gz)
md5sums=('da1639ea229b272f13025ec9281a42ad')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -D -m 0644 "${srcdir}/$pkgname-$pkgver/src/jping.png" "${pkgdir}/usr/share/linjap/jping.png"
  install -D -m 0644 "${srcdir}/$pkgname-$pkgver/dicts/genki.dict" "${pkgdir}/usr/share/linjap/dicts/genki.dict"
  install -D -m 0644 "${srcdir}/$pkgname-$pkgver/dicts/kana.dict" "${pkgdir}/usr/share/linjap/dicts/kana.dict"
}
