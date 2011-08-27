# Maintainer: Michael Witten <mfwitten>

pkgname=flashplugin-10.1
pkgver=10.1.102.64
pkgrel=3
pkgdesc="An older version of flashplugin"
url=http://kb2.adobe.com/cps/142/tn_14266.html
license=(custom)
provides=(flashplugin)
conflicts=(flashplugin)

arch=(i686)

depends=(mozilla-common libxt gtk2 nss curl)
makedepends=(unzip)

source=(http://fpdownload.macromedia.com/get/flashplayer/installers/archive/fp_10.1.102.64_and_9.0.289.0_archive.zip)
md5sums=(015e07f77169b8f5ca388b065b1c9071)

_archive=$(basename "${source[0]}")
noextract=("$_archive")

options=('!strip')

package()
{
  cd "$srcdir"

  local directory tarball license;
  directory="${_archive%.*}/Flash Player 10.1.102.64"
  tarball=$directory/10_1r102_64/flashplayer10_1r102_64_linux.tar.gz
  license=$directory/readme.txt

  install -d -m755 "$pkgdir/usr/lib/mozilla/plugins"
  install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
  install -d -m755 "$pkgdir/etc/adobe"

  unzip -p "$_archive" "$tarball" |
    tar -zx -C "$pkgdir/usr/lib/mozilla/plugins" libflashplayer.so

  unzip -p "$_archive" "$license" > "$pkgdir/usr/share/licenses/$pkgname/readme.txt"
}
