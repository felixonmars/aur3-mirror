# Maintainer: Christian Sturm <reezer@reezer.org>
pkgname=deliantra-bin
pkgver=20120413 # TODO: Next time use Last modified date from server
pkgrel=2
pkgdesc="open source, cooperative MMORPG"
arch=('i686' 'x86_64')
url="http://www.deliantra.net/"
license=('GPL')
depends=(libjpeg6 libpng12)
options=(!strip)
_srcurl=http://dist.schmorp.de/deliantra
_basename=deliantra-gnu-linux-x86
[ "$CARCH" = "x86_64" ] && _basename=deliantra-gnu-linux-amd64
_md5sums_x86=('af9639f219e1466d940149b2e457da7f')
_md5sums_x86_64=('c3f4fd28fb8a14bee9e337de08c8cbf8')
source=($_srcurl/$_basename.tar.gz)
md5sums=($_md5sums_x86)

[ "$CARCH" = "x86_64" ] && md5sums=(${_md5sums_x86_64[@]})

package() {
  install -D $srcdir/$_basename "$pkgdir/usr/bin/deliantra"
}

# vim:set ts=2 sw=2 et:
