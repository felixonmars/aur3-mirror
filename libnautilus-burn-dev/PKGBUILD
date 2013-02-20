# Maintainer: M4rQu1Nh0S <zonadomarquinhos@gmail.com>
pkgname=libnautilus-burn-dev
pkgver=2.25.3
pkgrel=1
pkgdesc="Lets you burn CDs and DVDs easily with GNOME, by drag-and-dropping files in the GNOME file manager with header libraries (with development headers)"
arch=(any)
url="https://launchpad.net/ubuntu/lucid/i386/libnautilus-burn-dev"
license=(GPL)
depends=(libnautilus-burn)
source=(http://launchpadlibrarian.net/40388288/${pkgname}_$pkgver-0ubuntu4_i386.deb)
md5sums=('6df2229a745b50202a2d7b688817b12d')

build() {
echo "unpacking deb"
  ar x ${pkgname}_$pkgver-0ubuntu4_i386.deb;
  cd $startdir/src;
echo "unpacking binary"
  tar xzf data.tar.gz -C $startdir/pkg
}

# vim:set ts=2 sw=2 et:
