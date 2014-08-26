# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=delorean-dark
pkgver=3.12_5.08242014
pkgrel=1
pkgdesc="The Metal Gtk Theme."
arch=('any')
url="http://fav.me/d7vgccg"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.12' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/delorean-dark-3.12_5.08242014.zip")
#install=$pkgname.install
#replaces=('delorean-dark-themes-3.8')
#conflicts=('delorean-dark-theme-3.8')

md5sums=('ffd2ab01f7cf780228f81763c0107d0a')


package() {
  # install themes
  
  #cd DORIAN

find DeLorean-Dark*/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
find DeLorean-Light*/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;             
}

# vim:set ts=2 sw=2 et:
