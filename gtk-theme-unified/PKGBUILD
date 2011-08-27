# Maintainer: max.bra <max dot bra at alice dot it>

pkgname=gtk-theme-unified
pkgver=0.4
pkgrel=4
pkgdesc="A clean and relaxing murrine based gtk theme (with extras)."
arch=(any)
url="http://gnome-look.org/content/show.php/Unified?content=121728"
license=('GPL')
depends=('gtk-engine-murrine' 'ubuntu-mono')
source=('http://gnome-look.org/CONTENT/content-files/121728-Unified.tar.gz'
        'http://dl.dropbox.com/u/6666889/gtk-theme-unified-extras.tar.gz')
md5sums=('691aec2c33b079ec02357d70bce4c40b'
         '16f2f0bc0149538942e2308c8f86b1c7')

build() {
  mkdir -p "$pkgdir"/usr/share/themes/
}

package() {
  cd "$srcdir"

  sed -i "s|panel-menu=24,24:gtk-button=16,16|panel-menu=22,22:panel=22,22:gtk-button=16,16:gtk-large-toolbar=22,22|" ./Unified/gtk-2.0/gtkrc || return 1

  cp -R Unified/ "$pkgdir"/usr/share/themes/

  install -D -m644 "${srcdir}"/Firefox.jar "${pkgdir}"/usr/share/themes/Unified/extras/Firefox.jar
  install -D -m644 "${srcdir}"/Thunderbird.jar "${pkgdir}"/usr/share/themes/Unified/extras/Thunderbird.jar
  install -D -m644 "${srcdir}"/Chrome.crx "${pkgdir}"/usr/share/themes/Unified/extras/Chrome.crx
}

# vim:set ts=2 sw=2 et:
