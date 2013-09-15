# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=delorean-light-theme-3.6
pkgver=1.01
pkgrel=3
pkgdesc="The Light Brushed-Metal Theme for gtk3, gtk2, metacity"
arch=('any')
url="http://fav.me/d5pp1w3"
license=('GPL''Creative Commons NC SA')
depends=('gtk-engines' 'gnome-themes-standard>=3.6.0' 'gtk-engine-murrine>=0.98.2')
source=("https://dl.dropboxusercontent.com/u/330352/${pkgname}_${pkgver}.zip")
md5sums=('3fa20f819ee51e5b780e794be42acf79')


package() {
  # install themes
  find delorean-light-theme-3.6/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
