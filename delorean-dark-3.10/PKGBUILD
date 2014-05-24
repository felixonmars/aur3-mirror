# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=delorean-dark-3.10
pkgver=8.05232014
pkgrel=1
pkgdesc="The Sexy Metal Gtk Theme."
arch=('any')
url="http://fav.me/d6a12ra"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.10.0' 'gtk-engine-unico' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/${pkgname}_${pkgver}.zip")
#install=$pkgname.install
#replaces=('delorean-dark-themes-3.8')
#conflicts=('delorean-dark-theme-3.8')

md5sums=('7f63975491f6f675d8a6f3066c9d64c3')


package() {
  # install themes
  
  #cd DORIAN

  find ${pkgname}/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;           
}

# vim:set ts=2 sw=2 et:
