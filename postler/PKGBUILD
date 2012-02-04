# Maintainer: Kosava <kosava@archlinux.us>

pkgname=postler
pkgver=0.1.1
pkgrel=3
pkgdesc="Postler is simple desktop mail client built in vala"
arch=('i686' 'x86_64')
url="https://launchpad.net/postler"
license=('GPL')
depends=('libwebkit' 'libunique' 'libcanberra' 'libnotify')
makedepends=('vala-010' 'intltool' 'librsvg' 'gettext' 'python2' 'msmtp')
optdepends=('dexter: provides contact completion'
            'lynx: enables HTML to text conversion')
provides=('postler')
conflicts=('postler-bzr')
install="postler.install"
source=(http://git.xfce.org/apps/$pkgname/snapshot/$pkgname-$pkgver.tar.bz2 $pkgname.install)
md5sums=('02e502c9f4a4b92e4ace32d9e268f06d'
         '7541710086c2b4f45da7268c137ed708')

build() {
  cd $srcdir/$pkgname-$pkgver
  msg "Patching the buildscript to use python2..."
  sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|g" waf
  export VALAC="/opt/vala-0.10/bin/valac"
   ./waf configure --prefix=/usr --disable-libindicate
   ./waf build
   ./waf --destdir=$pkgdir install
}