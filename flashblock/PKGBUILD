# Maintainer: Michael Witten <mfwitten>
# Contributor: Dave Nguyen <diendien@gmail.com>

pkgname=flashblock
pkgver=1.5.16
pkgrel=1
pkgdesc="Firefox add-on which blocks ALL Flash content"

url=http://flashblock.mozdev.org/
license=(MPL)

arch=(any)
depends=(firefox)

source=(http://downloads.mozdev.org/flashblock/flashblock-"$pkgver".xpi)
md5sums=(bf2ad5e23740f3d25cc91aa44499a354)

package()
{
  msg "Configuring ..."

  cd "$srcdir"
  
  # This isn't very safe over time; XML parsing should really be used
  local extension_id="$(awk -F'<em:id>|</em:id>' '/<em:id>/ {print $2; exit}' install.rdf)"

  local path_install="$pkgdir/usr/lib/firefox/extensions/$extension_id"

  msg "Installing ..."

  install -d "$path_install"
  
  for f in *; do
    if [[ $f != *.xpi ]]; then
      cp -R "$f" "$path_install"
    fi
  done
}
