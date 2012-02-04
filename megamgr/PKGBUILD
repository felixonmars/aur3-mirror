# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=megamgr
pkgver=5.20
pkgrel=3
pkgdesc="Lsi megamgr utility"
arch=(i686 x86_64)
url="http://www.lsi.com/support/downloads/index.html"
license=('unknown')
groups=()
depends=(bash)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://www.lsi.com/DistributionSystem/AssetDocument/files/support/rsa/utilities/megamgr/ut_linux_mgr_$pkgver.zip")
noextract=()
md5sums=("0417bd48936518322c3634a414b3c8d1")

build() {
  cd "$srcdir/"
  chmod 755 megamgr
  chmod 755 megamgr.bin
  chmod 644 *.txt
  # don't look for megamgr.bin in current directory. rely on $PATH instead
  sed -i 's/.\/megamgr.bin/megamgr.bin/' megamgr
  mkdir -p $pkgdir/usr/sbin
  mkdir -p $pkgdir/usr/share/doc/megamgr
  cp -ax megamgr* $pkgdir/usr/sbin
  cp -ax *.txt    $pkgdir/usr/share/doc/megamgr
}

# vim:set ts=2 sw=2 et:
