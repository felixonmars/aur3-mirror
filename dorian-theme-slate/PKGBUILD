# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=dorian-theme-slate
pkgver=3.14.06_03252015
pkgrel=2
pkgdesc="A sleek dark theme for gtk2+3 Gnome-Shell Cinnamon MATE Xfwm4 Unity Openbox Chromium Firefox"
arch=('any')
url="http://fav.me/d86da4w"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.14' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/dorian-theme-slate-3.14.06_03252015.zip")
install=$pkgname.install

md5sums=('ac5ebfc2da6aaef7a1b2977a482fbd0b')


package() {
  # install themes

  find Dorian-theme-slate*/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;           
}

# vim:set ts=2 sw=2 et:
