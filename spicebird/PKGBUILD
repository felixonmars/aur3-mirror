# Maintainer: <ndowens.aur at gmail dot com>
pkgname=spicebird
pkgver=0.8
pkgrel=1
pkgdesc="Collaboration client that provides integrated access to email, contacts, calendaring and instant messaging in a single application"
arch=('i686' 'x86_64')
url="http://www.spicebird.org"
license=('GPL2')
depends=('libpurple' 'gtk2')
optdepends=('spicebid-i18n')
provides=('spicebird')
conflicts=('spicebird-bin')
replaces=('spicebird-bin')
if [[ "$CARCH" = "x86_64" ]]; then
  source=("http://files.spicebird.org/pub/$pkgname.org/$pkgname/releases/$pkgver/linux-x86_64/en-US/$pkgname-$pkgver.en-US.linux-x86_64.tar.bz2" "$pkgname.desktop" "$pkgname.sh")
md5sums=('c69c9e268db1abcac5f5b1982801ff5d'
         'ccbe1f998c0fbc21458cb5e280badc81'
         'ffc4572432a91897b5d6b4e5b09a5996')

fi
if [[ "$CARCH" = "i686" ]]; then
  source=("http://files.spicebird.org/pub/$pkgname.org/$pkgname/releases/$pkgver/linux-i686/en-US/$pkgname-$pkgver.en-US.linux-i686.tar.bz2" "$pkgname.desktop" "$pkgname.sh")
 md5sums=('8353845fc855489f2e835f292a7fed39'
          'ccbe1f998c0fbc21458cb5e280badc81'
          'ffc4572432a91897b5d6b4e5b09a5996')
fi
build() {
  /bin/true
}
package() {
  
  cd "$srcdir/$pkgname"
  
  install -d $pkgdir/{usr/{share/applications,bin},opt/$pkgname}

  cp -r * $pkgdir/opt/$pkgname/

  install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname

  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

