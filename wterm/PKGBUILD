pkgname=wterm
pkgver=6.2.9
pkgrel=1
pkgdesc="Another X Terminal Emulator"
arch=('i686' 'x86_64' 'armv7h')
url="http://sourceforge.net/projects/wterm/"
license=('custom')
depends=('windowmaker')
source=("http://download.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('2d9f1de4c30fb637053dbceb3400aa3d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr && make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  chmod 0755 "${pkgdir}/usr/bin/wterm"

  #install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  #install -m644 "${srcdir}/LICENSE" \
  #    "${pkgdir}/usr/share/licenses/${pkgname}/"
  #install -m755 -d ${pkgdir}/usr/share/applications
  #install -m644 ${srcdir}/${pkgname}-${pkgver}/{xterm,uxterm}.desktop ${pkgdir}/usr/share/applications/
}
