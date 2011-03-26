# Maintainer: Jonny Gerold <jonny@fsk141.com>

pkgname=bin32-thunderbird3
_lang=en-US
pkgver=3.0
pkgrel=1
pkgdesc="Standalone Mail/News reader (installs besides thunderbird2)"
arch=('x86_64')
url="http://www.mozilla.org/projects/thunderbird"
license=('GPL')
depends=('gtk2>=2.10.0'  'libidl2' 'mozilla-common' 'nss>=3.11.4' 'lib32-libxt' 'libxt' 'lib32-gtk2' 'lib32-dbus-glib' 'lib32-libxdamage' 'lib32-libxss')
makedepends=('imagemagick')
provides=('thunderbird3')
source=(ftp://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/$pkgver/linux-i686/$_lang/thunderbird-$pkgver.tar.bz2
        thunderbird3.desktop)

md5sums=('f2a14133264d51f0fd5a690b4e7d814d'
         'a5648e652d6f989f7b9e45c83f707910')

build() {
  install -d $startdir/pkg/opt/mozilla \
             $startdir/pkg/usr/bin \
             $startdir/pkg/usr/share/{applications,pixmaps}

  cp -r $startdir/src/thunderbird $startdir/pkg/opt/mozilla/thunderbird3
  
  # Remove common mozilla aclocal stuff, XULRunner has it
  rm -rf $startdir/pkg/opt/mozilla/thunderbird3/share
  rm -rf $startdir/pkg/opt/mozilla/thunderbird3/include
  rm -rf $startdir/pkg/opt/mozilla/thunderbird3/pkgconfig

  ln -sf /opt/mozilla/thunderbird3/thunderbird $startdir/pkg/usr/bin/thunderbird3
  
  install -m644 $startdir/src/thunderbird3.desktop $startdir/pkg/usr/share/applications/
}
