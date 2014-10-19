# Maintainer: Michal Rus <m@michalrus.com>
_gnome_extension_id=755

_gnome_version=$(gnome-shell --version | sed -r 's/[^0-9.]//g')
_gnome_json=$(curl "https://extensions.gnome.org/extension-info/?pk=${_gnome_extension_id}&shell_version=${_gnome_version}")
_gnome_dload=$(echo "$_gnome_json" | sed -re 's/^.*"download_url":\s*"([^"]+).*$/\1/g')
_gnome_link=$(echo "$_gnome_json" | sed -re 's/^.*"link":\s*"([^"]+).*$/\1/g')
_gnome_uuid=$(echo "$_gnome_json" | sed -re 's/^.*"uuid":\s*"([^"]+).*$/\1/g')
_gnome_name=$(echo "$_gnome_uuid" | sed -re 's/^([^@]+).*$/\1/g')

pkgname="gnome-shell-extension-${_gnome_name}"
pkgver=$(echo $_gnome_json | sed -re 's/^.*"version_tag":\s*([0-9]+).*$/\1/g')
pkgrel=1
pkgdesc=$(echo "$_gnome_json" | sed -re 's/^.*"description":\s*"([^"]+).*$/\1/g')
arch=('any')
url="https://extensions.gnome.org${_gnome_link}"
license=('unknown')
depends=(gnome-shell-extensions systemd)
makedepends=(unzip)
source=("${_gnome_uuid}-${pkgver}.zip::https://extensions.gnome.org${_gnome_dload}")
sha256sums=(SKIP)

package() {
  local extdir="$pkgdir/usr/share/gnome-shell/extensions/hibernate-status@dromi"
  mkdir -p "$extdir"
  unzip -d "$extdir" "$srcdir/${_gnome_uuid}-${pkgver}.zip"
  chmod -R a+rX "$extdir"
}
