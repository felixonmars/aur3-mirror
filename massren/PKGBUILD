# $Id$
# Maintainer: raa0121 <raa0121@gmail.com>

pkgname=massren
pkgver=1.3.0
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}

source=(https://github.com/laurent22/massren/releases/download/v1.3.0/massren.linux-amd64.tar.gz)
sha256sums=('b54b4e0a41be4e0719ca0747b4de4bae66025307d07fbbd17f3fd4ad33b55989')

pkgdesc="Easily rename multiple files using your text editor"
url="https://github.com/laurent22/massren"
arch=(x86_64)
license=(MIT)


package() {

  mkdir -p ${pkgdir}/usr/bin
  install -m755 "$srcdir/massren" "$pkgdir/usr/bin/massren"
}

# vim:set ts=8 sts=2 sw=2 et:
