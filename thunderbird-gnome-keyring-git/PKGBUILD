# Maintainer hashstat <hashstat .AT. yahoo .DOT. com>

pkgname=thunderbird-gnome-keyring-git
pkgver=0.4.r15.f042383
pkgrel=1
pkgdesc="Thunderbird GNOME Keyring integration"
arch=(any)
url='https://github.com/swick/moz-gnome-keyring-integration'
license=(GPL3)
depends=(thunderbird libgnome-keyring)
makedepends=(git)
provides=(thunderbird-gnome-keyring)
conflicts=(thunderbird-gnome-keyring)
options=(!strip)
source=('git+https://github.com/swick/moz-gnome-keyring-integration')
md5sums=(SKIP)

pkgver() {
  cd moz-gnome-keyring-integration

  printf "%s.r%s.%s" \
    "$(sed -r '/<em:version>/!d;s/^\s+|<[^>]*>|\s+$//g;s/[ -]+/_/g' install.rdf)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd moz-gnome-keyring-integration

  local _extdir _file

  _extdir="$pkgdir/usr/lib/thunderbird/extensions/gnome-keyring-integration@sebastianwick.net"
  install -d "$_extdir"
  for _file in install.rdf chrome.manifest {components,content,defaults/preferences}/*.js; do
    install -m 0644 -D "$_file" "$_extdir/$_file"
  done
}

# vim:set ts=2 sw=2 et:
