# Contributor: Giuseppe Borzi <gborzi@ieee.org>
pkgname=samsung-mfp-sane
pkgver=3.00.37
pkgrel=1
pkgdesc="Binary only sane driver for MFP devices from samsung"
arch=('i686' 'x86_64')
url="http://www.samsung.com"
license=('custom:samsung')
depends=('libstdc++5' 'libxml2' 'sane' 'sed')
install=samsung-mfp-sane.install
backup=(etc/sane.d/smfp.conf)
source=(http://downloadcenter.samsung.com/content/DR/200902/20090225140447171/UnifiedLinuxDriver.tar.gz license.txt)
md5sums=('37cf8a04456767be374520c24570be7d' '8a9d57b9b1b46a1646eac3d054a2a5aa')

build() {
  cd "$srcdir/cdroot/Linux"

  install -m644 -D noarch/at_root/etc/sane.d/smfp.conf "$pkgdir/etc/sane.d/smfp.conf"
  install -m644 -D $srcdir/license.txt "$pkgdir/usr/share/licenses/samsung/license.txt"
  if [ "$CARCH" = "x86_64" ]; then
    install -m755 -D x86_64/at_root/usr/lib64/libmfp.so.1.0.1 "$pkgdir/usr/lib/libmfp.so.1.0.1"
    install -m755 -D x86_64/at_root/usr/lib64/sane/libsane-smfp.so.1.0.1 "$pkgdir/usr/lib/sane/libsane-smfp.so.1.0.1"
  else
    install -m755 -D i386/at_root/usr/lib/libmfp.so.1.0.1 "$pkgdir/usr/lib/libmfp.so.1.0.1"
    install -m755 -D i386/at_root/usr/lib/sane/libsane-smfp.so.1.0.1 "$pkgdir/usr/lib/sane/libsane-smfp.so.1.0.1"
  fi
  (cd "$pkgdir/usr/lib/sane/" && ln -s libsane-smfp.so.1.0.1 libsane-smfp.so.1)
}

# vim:set ts=2 sw=2 et:
