# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=delorean-dark-stripped-themes-3.8
pkgver=10082013
pkgrel=2
pkgdesc="Based on DeLorean-Dark with out the bloat. For Gtk2, Gtk3, Metacity, Xfwm4, LXDE & Openbox"
arch=('any')
url="http://fav.me/d6p6frd"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.6.0' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/DeLorean-Dark-Stripped-Themes-3.8_${pkgver}.zip")
install=$pkgname.install
#replaces=('delorean-dark-themes-3.8')
#conflicts=('delorean-dark-theme-3.8')

md5sums=('1c5fd55b50be4002c53c04468b06a39f')


package() {
  # install themes
  
  #cd DORIAN

  find delorean-dark-stripped-theme-3.9/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  find delorean-dark-stripped-theme-G-3.9/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  find delorean-dark-stripped-theme-P-3.9/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \; 
  find delorean-dark-stripped-theme-R-3.9/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;           
}

# vim:set ts=2 sw=2 et:
