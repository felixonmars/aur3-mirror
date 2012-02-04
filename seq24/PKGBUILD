# Maintainer: DonVla <donvla@users.sourceforge.net>

pkgname=seq24
pkgver=0.9.2
pkgrel=2
pkgdesc="Minimal loop based midi sequencer"
arch=(i686 x86_64)
options=('!libtool')
url="https://launchpad.net/seq24"
license=('GPL')
depends=('gtkmm' 'gcc-libs' 'jack')
source=("http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.bz2" "${pkgname}.desktop" "${pkgname}.png")
install="${pkgname}.install"
md5sums=('ea0d28eb4991e9190dd10b43617b9f25'
         'ecc750aff6499f63e17add73d24f5521'
         'f9d162adb9c60a28955cb7a9520ed555')
sha256sums=('dbcfd18b7744ae739717588dd71a9923e5c08cf8fe1d3e71c897515cab875b0a'
            'f1f593a8b4822faaad26935773904487671c458b13179c6377126e0b670902f7'
            '12aab0cf953a37940801ca4c0eef204e95a80ae1a29ff1b6be531a24f517a960')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-lash
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -v -d -m 0755 "${pkgdir}/usr/share/seq24"
  install -v -m 0644 {NEWS,SEQ24,ChangeLog,seq24usr.example} "${pkgdir}/usr/share/seq24"
  install -v -D -m 0644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -v -D -m 0644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
