# Maintainer: Gently <toddrpartridge@gmail.com>

# This is intended as a generic data package for retail game Enemy Territory:
# Quake Wars.

# Localization is untested in the Linux builds at this point. More localization
# features are possible in future release.

# A script is provided to copy the game files to the PKGBUILD dir.($startdir) 
# [etqw-data-dvdcp.sh]; edit the script to point to the disc mount point(s).

pkgname=etqw-data
pkgver=1.0
pkgrel=1
pkgdesc="Enemy Territory: Quake Wars game files"
arch=('any')
url="http://zerowing.idsoftware.com/linux/doom/Doom3FrontPage/"
license=('custom')
source=('etqw-data-dvdcp.sh'
        'License.txt'
        'etqw-dvd-files.tar.md5')
md5sums=('26ed8ba202bd46a62889fe7222cbd19a'
         '83e4cafd265368b351e068afdcb39a46'
         'e96782b8c73755accfd633f26d28a024')
PKGEXT='.pkg.tar' # archive only as game files are already compressed

prepare() {
  cd "$startdir"
  echo "Checksumming game files..." && \
  if md5sum -c etqw-dvd-files.tar.md5; then
    echo "Checksums passed"
  else
    echo "Checksum(s) failed" && exit 1
  fi
}

package() {
  cd "$startdir"
  # Directory create for game files
  install -dm755 "$pkgdir"/opt/etqw/base/
  # License install
  install -Dm644 License.txt "$pkgdir"/usr/share/licenses/"$pkgname"/license.txt
  # Game files install
  echo "Copying game files..." && \
  tar -xf $startdir/etqw-dvd-files.tar -C $pkgdir/opt/etqw/base/
  # Permissions correc t
  find $pkgdir/opt/etqw/base/ -type f -name "*.pk4" -name "*.mega" \
    -exec chmod 644 {} \;
}