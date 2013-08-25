# Maintainer: György Balló <ballogy@freestart.hu>

pkgname=mintnanny
pkgver=1.4.1
pkgrel=1
pkgdesc="Blocks outgoing traffic towards chosen domain names using /etc/hosts"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mintnanny/"
license=('GPL')
depends=('pygtk')
optdepends=('gksu: to run mintnanny directly from menu')
source=(http://packages.linuxmint.com/pool/main/m/$pkgname/${pkgname}_$pkgver.tar.gz
        arch.patch)
md5sums=('f0069e5166b5e0e1254a25e50480bc19'
         'c00fa7eff115acb33b3b76d210c249b4')


prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i "$srcdir/arch.patch"
  sed -i 's/^Exec=mintnanny/Exec=gksu mintnanny/' usr/share/applications/mintNanny.desktop
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

package() {
  cd "$srcdir/$pkgname"

  cp -r usr $pkgdir/
}
