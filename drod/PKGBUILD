# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=drod
pkgver=1.6.7
pkgrel=2
pkgdesc="Control a sword-swinging character that explores dungeons and fights monsters in this puzzle game"
arch=('i686' 'x86_64')
url="http://web.archive.org/web/20060304102214/http://www.drod.net/"
license=('MPL')
depends=('sdl_ttf' 'alsa-lib' 'libstdc++5' 'desktop-file-utils')
install=$pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/DRODAESetup-$pkgver.run
        $pkgname-ae.desktop $pkgname-ae)
md5sums=('9356058c3721398c97cede2b48a1a73b'
         '345fc5de0205509f30479a485ee0b9d0'
         '3d52f716f8040b7dde06d35f20b1a922')

package() {
  cd "${srcdir}"

  sh "${srcdir}"/DRODAESetup-$pkgver.run --target $pkgname-$pkgver --noexec

  install -d "${pkgdir}"/opt/$pkgname-ae "${pkgdir}"/usr/bin

  cp -R "${srcdir}"/$pkgname-$pkgver/Data "${pkgdir}"/opt/$pkgname-ae
  cp -R "${srcdir}"/$pkgname-$pkgver/Libs "${pkgdir}"/opt/$pkgname-ae
  find "${pkgdir}"/opt/$pkgname-ae -type f -exec chmod 644 "{}" \;
  install -D -m755 "${srcdir}"/$pkgname-$pkgver/bin/Linux/x86/glibc-2.1/$pkgname-ae.bin \
    "${pkgdir}"/opt/$pkgname-ae/$pkgname-ae.bin

  install -D -m644 "${srcdir}"/$pkgname-$pkgver/${pkgname}ae.xpm \
    "${pkgdir}"/usr/share/pixmaps/${pkgname}-ae.xpm
  install -D -m755 "${srcdir}"/$pkgname-ae "${pkgdir}"/usr/bin/$pkgname-ae
  install -D -m644 "${srcdir}"/$pkgname-ae.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname-ae.desktop
}
