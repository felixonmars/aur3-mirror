# Maintainer : Rob McCathie (korrode) <archaur at rmcc dot com dot au
# Contributor: Todd Harbour <aur @AT@ quadronyx .DOT. org>
# Contributor: Philip Müller <philm_at_manjaro_dot_org>

pkgname=xfce-theme-adwaita-manjaro-lighter
pkgver=20131227
pkgrel=2
pkgdesc="Desktop suite for Xfce"
arch=('i686' 'x86_64')
url="http://git.manjaro.org/korrode/package-sources/tree/master/adwaita-manjaro-lighter-theme"
license=('GPL2' 'CCPL')
depends=('gtk-engine-murrine' 'gnome-themes-standard')
#makedepends=('')
#optdepends=('')
provides=("adwaita-manjaro-lighter-theme")
conflicts=("adwaita-manjaro-lighter-theme")
#replaces=('')
#install="$pkgname".install
source=("adwaita-manjaro-themes-20131227.tar.gz::http://git.manjaro.org/artwork/adwaita-manjaro-themes/repository/archive.tar.gz?ref=479147ffbc5dabd114450c83c4d30eb69679afc4")
sha256sums=('c0ccd39014b8e7d8e34e4fdf656d7ad67f04fc874477aaca0a367badaec9adba')

prepare() {
  cd "$srcdir/adwaita-manjaro-themes.git/Adwaita-Manjaro-light"
  find ./ -type f -exec sed -i 's|Adwaita-Manjaro-light|Adwaita-Manjaro-lighter|g' {} \;
  find ./ -type f -exec sed -i 's|Adwaita-Manjaro light|Adwaita-Manjaro lighter|g' {} \;
  find ./ -type f -exec sed -i 's|#d3d3d3|#ededed|g' {} \;
  find ./ -type f -exec sed -i 's|#D3D3D3|#EDEDED|g' {} \;
  find ./ -type f -exec sed -i 's|#d5d5d5|#ededed|g' {} \;
  find ./ -type f -exec sed -i 's|#D5D5D5|#EDEDED|g' {} \;
  
  cd "$srcdir/adwaita-manjaro-themes.git/Adwaita-Manjaro-light/xfwm4"
  find -name \*inactive\*xpm|while read f; do cp "${f}" "${f/inactive/active}"; done
}

package() {
  cd "$srcdir/adwaita-manjaro-themes.git/Adwaita-Manjaro-light"

  # create theme dir
  install -d -m 755 "$pkgdir"/usr/share/themes/Adwaita-Manjaro-lighter

  # install theme
  cp -r . "$pkgdir"/usr/share/themes/Adwaita-Manjaro-lighter
}
