# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Gabor Nyekhelyi (n0gabor) <n0gabor@vipmail.hu>
# Contributor: Stefan Husmann <<stefan.husmann@t-systems.com>>

pkgname=bfcommander
pkgver=0.3.9
pkgrel=6
arch=('i686' 'x86_64')
pkgdesc="A fast and powerful twin-panel file manager"
url="http://www.hi-net.cz/blaza/bfcommander/"
license=('GPL')
depends=('libjpeg6' 'libsm' 'libxext')
[[ $CARCH == x86_64 ]] && depends=(${depends[@]/#/lib32-})
options=('!emptydirs')
install=$pkgname.install
_lng=http://www.hi-net.cz/blaza/$pkgname/download/language
source=(http://www.hi-net.cz/blaza/$pkgname/download/bfc-$pkgver-all.tar.gz
        bflng bflng.fn $pkgname.desktop $_lng/hungarian/hungarian-0.3.8.tar.gz
        $_lng/russian/bfc-0.3.9-ru-lng-full.tar.gz $_lng/pt_BR/pt_BR.tar.gz
        $_lng/polish/polish-0.3.9.tar.bz2 $_lng/slovak/slovak-0.3.8.lng.gz
        $_lng/german/bfc-german-utf8-0.3.9.tar.gz)
noextract=(hungarian-0.3.8.tar.gz bfc-0.3.9-ru-lng-full.tar.gz pt_BR.tar.gz
           polish-0.3.9.tar.bz2 slovak-0.3.8.lng.gz bfc-german-utf8-0.3.9.tar.gz
           bfc-$pkgver-all.tar.gz)
md5sums=('392127ffae62f0bd88fd13dd5d2f26a0' '44d8d8b401002c0b69eaeebfd2c7759a'
         'd0805645d7c4b65c6a91e8aec295db22' '222095a9cc66ebcb04877eddd4e60a52'
         '3b7af136067507b5103b237f2bd27f02' '4dac1b1c2f6da570e9b888b405389fa7'
         'e9ce4ff3c9d23fa3cbce8a4ec87e35f3' '282e32c85925506d665a6460c3107fdc'
         'cbaea3364a0a11747db325c89ea8d808' '6c9dbfe76d8671f87d688e4b61a7c7c0')

package() {
  cd "$srcdir"
  install -Dm755 bflng "$pkgdir/usr/share/$pkgname/bflng"
  install -Dm644 bflng.fn "$pkgdir/usr/share/$pkgname/bflng.d/bflng.fn"
  install -Dm644 *.gz *.bz2 "$pkgdir/usr/share/$pkgname/bflng.d"

  msg2 "Base files..."
  tar xzf bfc-$pkgver-all.tar.gz -C "$pkgdir" \
    --transform="s#^$pkgname/#usr/share/&#" \
    --transform='s/bfc$/bfcmd/'
  chown -R root:root "$pkgdir/usr/share"
  sed -i 's|usr/local|usr/share|' "$pkgdir/usr/share/$pkgname/bfcmd"

  msg2 "Bin links..."
  install -dm755 "$pkgdir/usr/bin"
  ln -sf /usr/share/$pkgname/bflng "$pkgdir/usr/bin/bflng"
  ln -sf /usr/share/$pkgname/bfcmd "$pkgdir/usr/bin/bfcmd"

  msg2 "Desktop entry..."
  install -dm755 "$pkgdir/usr/share/pixmaps"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  ln -sf /usr/share/$pkgname/icons/bfc32x32.png "$pkgdir/usr/share/pixmaps/bfcmd.png"

  find "$pkgdir/usr/share/$pkgname/doc" -name 'README' -exec rm -f '{}' \;
}

# vim:set ts=2 sw=2 et:
