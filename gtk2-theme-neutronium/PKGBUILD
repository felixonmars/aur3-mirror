# Contributor: 3ED <krzysztof1987@gmail.com>

pkgname=gtk2-theme-neutronium
pkgver=0.5
pkgrel=1
pkgdesc="Neutronium is dark and beautyful theme for gnome/gtk2"
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php/Neutronium+Unity?content=59189"
license=('GPL')
groups=('gtk2-themes')
depends=('gtk2')
install=info.install
source=("http://www.gnome-look.org/CONTENT/content-files/59189-Neutronium%20Gilouche.tar.gz" \
  "Neutronium-Sharp.tar.gz" \
  "Neutronium-Rounded.tar.gz" \
  "Neutronium-png.tar.gz")
md5sums=('17be41082ffe162435a0a0f1b9573646' \
  '8f95f242bbca03900b266381e2f693c8' \
  'ddccfa04a777a24a5195208236e33ba9' \
  'c8cb05e2fe881e8e54532346bff49ab4')

build() {
  mkdir -pv "$startdir/pkg/usr/share/themes"
  mkdir -pv "$startdir/pkg/usr/share/pixmaps"

  cd "$startdir/pkg/usr/share/themes"
  tar -xvf "$startdir/src/Neutronium Gilouche/Neutronium Gilouche.tar.gz" # 1
  mv -v "$startdir/src/Neutronium-Sharp" . # 2
  mv -v "$startdir/src/Neutronium-Rounded" . # 3
  [ "$(ls -1|wc -l)" == "3" ] || return 1 # test

  cd "$startdir/pkg/usr/share/pixmaps"
  mv -v "$startdir/src/neutronium" . # 1
  [ "$(ls -1|wc -l)" == "1" ] || return 1 # test

  cd "$startdir/pkg/usr/share"
  chown -R root:root ./ || return 1
  chmod -R 644 ./ || return 1
  chmod -R a+X ./ || return 1
}

# vim:set ts=2 sw=2 et:
