# Maintainer: Ner0

pkgname=screencastor
pkgver=1.3.0
pkgrel=2
pkgdesc="A powerful screencasting app written in python"
arch=('any')
url="https://launchpad.net/~hizo/+archive/screencastor/"
license=('GPL')
depends=('python2' 'pygtk' 'pygtksourceview2' 'vte' 'ffmpeg' 'sed' 'bash' 'imagemagick' 'hicolor-icon-theme')
options=('!emptydirs')
install=$pkgname.install
source=("https://launchpad.net/~hizo/+archive/screencastor/+files/${pkgname}_${pkgver}~ppa1~saucy.tar.gz")
md5sums=('0d83946d573e5270df81ae43a00a331d')

package() {
  cp -rf $pkgname/usr "$pkgdir/"

  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' "$pkgdir/usr/share/screencastor/screencastor.py"
  
  chmod +x "$pkgdir"/usr/{bin/screencastor,share/screencastor/screencastor.{glade,py,sh}}
}

# vim:set ts=2 sw=2 et:
