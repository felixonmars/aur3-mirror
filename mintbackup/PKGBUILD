# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=mintbackup
pkgver=2.0.8
pkgrel=1
pkgdesc="Easily backup and restore your personal data and your software selection"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mintbackup/"
license=('GPL')
depends=('pygtk' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme' 'xdg-utils')
optdepends=('gksu: to run mintbackup directly from menu')
install=$pkgname.install
source=(http://packages.linuxmint.com/pool/main/m/$pkgname/${pkgname}_$pkgver.tar.gz
        arch.patch)
md5sums=('da8d9c49be4a4e70571a52026d17dd2a'
         'd85d45e0807290e45a00832aa0ef9e0f')

build() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i "$srcdir/arch.patch"
  sed -i 's/^Exec=mintbackup/Exec=gksu mintbackup/' usr/share/applications/mintBackup.desktop
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

package() {
  cd "$srcdir/$pkgname"

  cp -r usr $pkgdir/
}
