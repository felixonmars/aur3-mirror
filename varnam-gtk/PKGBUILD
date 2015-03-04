# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=varnam-gtk
pkgver=3.14_05.03022015
pkgrel=1
pkgdesc="A desaturated blue patterned Theme for Gtk2 & 3, MATE, GoogleChrome, Gnome-Shell, & Openbox"
arch=('any')
url="http://fav.me/d8cn53k"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.14' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/varnam-gtk-3.14_05.03022015.zip")


md5sums=('98adcbf99a3d45584038d8b50f619a00')


package() {
  # install themes

  find "varNaM-Gtk"/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;           
}

# vim:set ts=2 sw=2 et:
