# Maintainer: Chris Down <chris@chrisdown.name>
# Contributor: Yung Wood <yung at yung.com.au>
# Contributor: Joshua Stiefer <facedelajunk at gmail.com>
# Contributor: Michael Seiwald <michael at mseiwald.at>
# Contributor: Techlive Zheng <techlivezheng at gmail.com>

pkgname=lastpass-pocket
pkgver=3.1.0
pkgrel=1
pkgdesc="Backup and offline access for LastPass"
arch=('i686' 'x86_64')
url="https://lastpass.com"
license=('LastPass')
options=('!strip')
depends=('ca-certificates' 'openssl' 'libldap' 'libidn' 'gtk2' 'libpng12')
[ "$CARCH" = 'x86_64' ] && _64=_x64
source=("https://download.lastpass.com/pocket$_64.tar.bz2"
        'lastpass.desktop'
        'lastpass.png')
md5sums=('04aa34733b672a2647d3477f6914da35'
         '09297a72acb09a0629c7a8ba110406a4'
         '02df30690fb98147258346f0d96251b0')
[ "$_64" ] && md5sums[0]='ef1df5c0a3b67c895f0678d4d82e9142'

build() {
  sed -i 's/libssl.so.0.9.8/libssl.so.1.0.0/g' pocket$_64
  sed -i 's/libcrypto.so.0.9.8/libcrypto.so.1.0.0/g' pocket$_64
}

package() {
  install -Dm755 pocket$_64 "$pkgdir/usr/bin/lastpass"
  install -Dm644 lastpass.png "$pkgdir/usr/share/icons/lastpass.png"
  install -Dm644 lastpass.desktop "$pkgdir/usr/share/applications/lastpass.desktop"
}
