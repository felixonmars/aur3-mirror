# Maintainer: XZS <d.f.fischer at web dot de>

pkgname="gnome-shell-extension-remove-dropdown-arrows"
pkgdesc="Removes the dropdown arrows from the AppMenu and SystemMenu (AggregateMenu) which were introduced in Gnome 3.10."
pkgver=5.r0.g7d42ad1
pkgrel=1
arch=(any)
url="https://github.com/mpdeimos/gnome-shell-remove-dropdown-arrows"
license=(GPLv3)
depends=('gnome-shell>=3.10')

# template start; name=git; version=1;
makedepends+=('git')
source+=("$pkgname::git+$url")
md5sums+=('SKIP')
provides+=("${pkgname%-git}")
conflicts+=("${pkgname%-git}")

pkgver() {
  cd $pkgname
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/'
  if [ ${PIPESTATUS[0]} -ne 0 ]; then
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

# vim: filetype=sh
# template end;
# template start; name=modularize-package; version=1;
package() {
  for function in $(declare -F | grep -Po 'package_[[:digit:]]+[[:alpha:]_]*$')
  do
    $function
  done
}

# vim: filetype=sh
# template end;
# template start; name=install-code; version=1;
package_01_locate() {
  msg2 'Locating extension...'
  cd "$(dirname $(find -name 'metadata.json'))"
  extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  destdir=""$pkgdir/usr/share/gnome-shell/extensions/$extname""
}

package_02_install() {
  msg2 'Installing extension code...'
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "$destdir" '{}' +
}

# vim: filetype=sh
# template end;
