# Maintainer: crazyelf5

pkgname=cinnamon-extensions-git
pkgver=20120314
pkgrel=1
pkgdesc="Extensions for Cinnamon"
arch=('any')
url="https://github.com/linuxmint/cinnamon-extensions"
license=('GPL')
depends=('cinnamon' 'dconf')
makedepends=('git')
install=$pkgname.install
source=('cinnamon-weather-config.desktop')
md5sums=('950949f54ae20ea5635c5c394322c58e')

_gitroot=git://github.com/linuxmint/cinnamon-extensions.git
_gitname=cinnamon-extensions

build() {
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  find . -type d -name "usr" -exec cp -rf '{}' "$pkgdir/" \;
  install -Dm644 cinnamon-weather-config.desktop "$pkgdir/usr/share/applications/cinnamon-weather-config.desktop"

  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' "$pkgdir/usr/bin/cinnamon-weather-extension-config"
  for i in `find "$pkgdir/" -type f -name metadata.json`; do sed -i 's|"1.2"|"1.2", "1.3.0", "1.3.1", "1.4.0"|' $i; done
}

# vim:set ts=2 sw=2 et:
