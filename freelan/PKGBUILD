# Maintainer: Elie Bouttier <elie@bouttier.eu.org>
# Contributor: Pierre Carrier <pierre@gcarrier.fr>
_ghuser=freelan-developers
pkgname=freelan
pkgver=1.1
_pkgid=861908e
pkgrel=2
pkgdesc="Open-source, multi-platform, peer-to-peer VPN software"
arch=(i686 x86_64)
url="http://www.freelan.org/"
license=('GPL')
depends=('libfreelan')
makedepends=('scons' 'python2-setuptools' 'freelan-buildtools' 'boost')
backup=(etc/freelan/freelan.cfg)
source=("https://github.com/$_ghuser/$pkgname/tarball/$pkgver"
        "freelan.service")
md5sums=('3d9640000bf48822bbe91cdaa4c2b591'
         '7323da26996ecc979dcd41c3c83ce2c2')

sconsflags="-j1"

build() {
  cd "$srcdir/$_ghuser-$pkgname-$_pkgid"
  scons $sconsflags
}

package() {
  cd "$srcdir/$_ghuser-$pkgname-$_pkgid"
  scons install $sconsflags prefix="$pkgdir/usr"

  install -d -m 755 ${pkgdir}/etc/freelan
  install -D -m 644 config/freelan.cfg ${pkgdir}/etc/freelan/freelan.cfg
   
  install -d -m 755 ${pkgdir}/etc/freelan/certificates/samples
  install -D -m 644 config/{alice*,bob*} ${pkgdir}/etc/freelan/certificates/samples/

  install -D -m 644 "${srcdir}/freelan.service" "${pkgdir}/usr/lib/systemd/system/freelan.service"
}
