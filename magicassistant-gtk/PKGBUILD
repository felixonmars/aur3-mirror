# Maintainer: Shaun Hammill <plloi.pllex@gmail.com>
# Contriubter: Travis Lyons <travis.lyons@gmail.com>
# Contributer: Tanguy ALEXIS <alexis.tanguy@yahoo.fr>

pkgname=magicassistant-gtk
pkgver=1.3.0.4
pkgrel=1
pkgdesc="Card Browser, Library Organizer, Deck Builder and Tournament Manager for Magic the Gathering Card Game"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/mtgbrowser/"
license=('EPL')
depends=(gtk2 java-runtime unzip libwebkit)
source=('source')
md5sums=('md5sums')

if test "$CARCH" == "x86_64"; then
  source=(http://downloads.sourceforge.net/project/mtgbrowser/Magic_Assistant/${pkgver}/magicassistant-${pkgver}-linux.gtk.x86_64.zip magicassistant.desktop)
  md5sums=('af62a7f093496e9d94370b8f3958cea5'
           '37f143dbb28032d4fcc7a0a6e4e7f239')
fi

if test "$CARCH" == "i686"; then
  source=(http://downloads.sourceforge.net/project/mtgbrowser/Magic_Assistant/${pkgver}/magicassistant-${pkgver}-linux.gtk.x86.zip magicassistant.desktop)
  md5sums=('3eb8e94865391184d8e3077272d0aca7'
           '37f143dbb28032d4fcc7a0a6e4e7f239')
fi

package() {
    msg "Installing..."
    install -d "$pkgdir"/{/usr/bin,/opt,/usr/share/applications}
    install -m644 $srcdir/magicassistant.desktop $pkgdir/usr/share/applications/magicassistant.desktop
    mv $srcdir/MagicAssistant $pkgdir/opt
    msg "Link to bin..."
    ln -s /opt/MagicAssistant/magicassistant $pkgdir/usr/bin/magicassistant
    msg2 "Done!"
}


# vim:set ts=2 sw=2 et:
