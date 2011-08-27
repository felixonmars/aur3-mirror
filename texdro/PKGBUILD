# Maintainer: Misterxxitalia <pulcini.fabio @ alice . it>
pkgname=texdro
pkgver=2.2.0
pkgrel=1
pkgdesc="send sms from pc with your phone Android!"
arch=('any')
url="http://www.crackedsun.com/texdro/"
license=('GPL2' 'BSD')
depends=('java-runtime' 'unrar')
source=(http://www.crackedsun.com/files/Free/Nix/TexdroDesktop_v$pkgver.rar
        texdro
        texdro.desktop
        texdro.ico)

md5sums=('0003233fff1defdcfc0c28e11cc307cc'
         'b252921b01d1c7196a47d6f9c3f8e5b2'
         '6e7342f5bb9bd2aded0010d689bdb10a'
         'fbbcc23088f9e77c70e1d26b3f2dbff0')

package() {
  cd "$srcdir"
  unrar e TexdroDesktop_v$pkgver.rar
  install -d ${pkgdir}/usr/share/java/texdro
  cp TexdroDesktop.jar "$pkgdir/usr/share/java/texdro"
  cp texdro.ico "$pkgdir/usr/share/java/texdro"
  install -Dm644 texdro.desktop "$pkgdir/usr/share/applications/texdro.desktop"
  install -Dm755 texdro "$pkgdir/usr/bin/texdro"
}


