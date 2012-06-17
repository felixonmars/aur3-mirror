# Maintainer: Daniel Wallace<daniel.wallace at gatech dot edu>
pkgname=mememaker
pkgver=2.0.0
pkgrel=1
pkgdesc="create memes from the command line, including the posibility to create split memes now with all options available from the command line"
arch=('any')
url="http://www.reddit.com/r/ScriptSwap/comments/r1oxf/bash_meme_maker_script_creates_meme_in_terminal/"
license=('GPL')
depends=('curl' 'imagemagick' 'ttf-ms-fonts')
provides=('mememaker')
install=mememaker.install
source=(http://code.gtmanfred.com/cgit/$pkgname.git/snapshot/$pkgname-$pkgver.tar.xz
        $pkgname.install)
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir INSTALL_DIR=/usr install
}

# vim:set ts=2 sw=2 et:
md5sums=('25552bfedc2451648d4dba60f8dcf620'
         'b89d1414d659056f134f6b69be931a16')
