# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=dorian-theme-3.10
pkgver=105222014
pkgrel=2
pkgdesc="An Elegant Dark Theme for Gtk2, Gtk3, Metacity, Xfce, Lxde, Openbox, Chromium & Firefox Browser"
arch=('any')
url="http://fav.me/d6vvwot"
license=('GPLv3')
depends=('gtk-engines' 'gtk-engine-unico>=1.0.2-3' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/${pkgname}_${pkgver}-${pkgrel}.zip")
#install=$pkgname.install
md5sums=('9e1b9b20383eeab22cb303b8ab131fd9')


package() {
  # install themes
  
  #cd DORIAN

  find dorian-theme-3.10/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  find dorian-retro-left-metacity/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  find dorian-retro-right-metacity/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;  
  find dorian-neon/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;            
}

# vim:set ts=2 sw=2 et:
