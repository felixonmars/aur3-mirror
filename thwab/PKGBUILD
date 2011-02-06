# Contributor: Nezmer <Nezmer@gmail.com>

pkgname=thwab
pkgver=2.2.3
pkgrel=3
pkgdesc="Electronic Encyclopedia which can view and search books in .th or .bok formats. It also includes 'Othman Quran Browser' which displays Quranic text in Othmani script style."
arch=('i686' 'x86_64')
url="http://thwab.ojuba.org"
license=(custom:Waqf)
depends=('pygtk' 'sqlite3' 'mdbtools-devel')
makedepends=()
source=(http://www.ojuba.org/downloads/$pkgname/${pkgname}-${pkgver}.tar.bz2)
install=${pkgname}.install
md5sums=('8bd7d05ca4aca0e32b45ece9953aeb8e')

build() {

  cd ${srcdir}/${pkgname}-${pkgver}/
  sed -i 's| c.execute(\"END TRANSACTION;\")|#c.execute(\"END TRANSACTION;\")|' ${srcdir}/${pkgname}-${pkgver}/${pkgname}/ThwabShamelaImport.py
  python setup.py build
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D -m644 othman-128.png ${pkgdir}/usr/share/icons/othman.png
  install -D -m644 $pkgname.svg ${pkgdir}/usr/share/icons/$pkgname.svg
  install -D -m644 SimplifiedNaskh.ttf ${pkgdir}/usr/share/fonts/ttf-$pkgname/SimplifiedNaskh.ttf 
  install -D -m644 $pkgname.keys ${pkgdir}/usr/share/mime-info/$pkgname.keys
  install -D -m644 $pkgname.mime ${pkgdir}/usr/share/mime-info/$pkgname.mime
  install -D -m644 LICENSE-en ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 $pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
  install -D -m644 othman.desktop ${pkgdir}/usr/share/applications/othman.desktop
}
