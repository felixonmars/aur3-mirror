# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=ipxripd
pkgver=0.8
pkgrel=4
pkgdesc="IPX RIP/SAP daemon for Linux"
arch=("i686" "x86_64")
url="ftp://sunsite.unc.edu/pub/Linux/system/filesystems/ncpfs/!INDEX.html"
license=('GPL2')
optdepends=(
            "ipx: IPX configuration tools (same as ncpfs but older)"
            "ncpfs: IPX configuration and NetWare tools"
            )
source=("ftp://sunsite.unc.edu/pub/Linux/system/filesystems/ncpfs/$pkgname-$pkgver.tar.gz"
        "0001-Fix-type-declaration-mismatch.patch"
        "0002-Fix-implicit-declaration-warnings.patch"
        "0003-Update-paths-to-proc-net-ipx.patch"
        "ipxd.service")
sha1sums=('2e6e963948492437d4897a610bc7e07d0c46a518'
          'cb5d4f80c801dd8e4ee56a80e619491e01f72a15'
          '8c8067a544a8ff51391599e841abd8f9d6385811'
          '139e9cb29cc754f91d331d4455160cd326ca90e0'
          'def1f02acbda8658316ec2787c23753e7e2afcf1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 < "$srcdir/0001-Fix-type-declaration-mismatch.patch"
  patch -p1 < "$srcdir/0002-Fix-implicit-declaration-warnings.patch"
  patch -p1 < "$srcdir/0003-Update-paths-to-proc-net-ipx.patch"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm0755 "ipxd"          "$pkgdir/usr/sbin/ipxd"
  install -Dm0644 "ipxd.8"        "$pkgdir/usr/share/man/man8/ipxd.8"
  install -Dm0644 "ipx_ticks.5"   "$pkgdir/usr/share/man/man5/ipx_ticks.5"

  install -Dm0644 "$srcdir/ipxd.service"  "$pkgdir/usr/lib/systemd/system/ipxd.service"
}

# vim:set ts=2 sw=2 et:
