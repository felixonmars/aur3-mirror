# Maintainer: XZS <d.f.fischer at web dot de>

pkgname='gnome-shell-extension-justshowthewindow'
pkgdesc="Rather than the default gnome-shell behaviour of showing a notification that a window is ready, the window is just displayed"
pkgver=r2.275595c
pkgrel=1
arch=(any)
depends=('gnome-shell>=3.6')
license=(GPLv2)
url="https://github.com/ryanlerch/gnome-shell-extension-justshowthewindow"

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
# template start; name=adjust-version; version=1;
prepare() {
  # adjust for shell versions that are not officially supported.
  local min=$(echo ${depends[@]} | grep -Po '(?<=gnome-shell>=3\.)[[:digit:]]+')
  local max=$(echo ${depends[@]} | grep -Po '(?<=gnome-shell<3\.)[[:digit:]]+')
  if [ -z "$max" ]
  then
    max=$(gnome-shell --version | grep -Po '(?<=GNOME Shell 3\.)[[:digit:]]+')
  fi
  sed -i 'H;1h;$!d;x;
    s/"shell-version": \[.*\]/"shell-version": [ '"$(seq -s ', ' -f '"3.%g"' $min 2 $max)"' ]/'\
      */metadata.json
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
