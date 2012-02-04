# Maintainer: Mitchel Humpherys <mitch.special@gmail.com>
pkgname=google-music-manager-wine
pkgver=3.1
pkgrel=2
pkgdesc="Google Music Manager (beta) uploader (wine)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/google-music-manager-linux-wine/"
license=('Apache')
depends=('wine')
provides=('MusicManager')
source=(http://google-music-manager-linux-wine.googlecode.com/files/MusicManagerv2.zip MusicManagerRun)
md5sums=('8d77d352f283fa6304eb8f1c1d991caf'
         'fa2903c02f4412ccecdecd8d47b0fe7e')




build() {
  install -d -m755 ${pkgdir}/usr/share/${pkgname}
  cp -ra ${srcdir}/MusicManager/* ${pkgdir}/usr/share/${pkgname}/

  find ${pkgdir}/usr/share -type f -exec chmod 644 "{}" \;
  find ${pkgdir}/usr/share -type d -exec chmod 755 "{}" \;

  install -d -m755 ${pkgdir}/usr/bin
  install -m755 ${srcdir}/MusicManagerRun ${pkgdir}/usr/bin/MusicManager
}
