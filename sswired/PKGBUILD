# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Schala Zeal <schalaalexiazeal@gmail.com>

pkgname=sswired
pkgver=2012.11.05
pkgrel=1
pkgdesc="Simple Wired client"
[ "$CARCH" = "i686"   ] && depends=(gtk2)
[ "$CARCH" = "x86_64" ] && depends=(lib32-gtk2)
arch=('i686' 'x86_64')
license=("unknown")
makedepends=('unzip')
source=("http://shaosean.tk/ssWired/${pkgver//./}/ssWired_linux_${pkgver//./}_full.zip"
"sswired.desktop")
url="http://www.shaosean.tk/ssWired.html"
md5sums=('9dafdf5018ffd20f58643251269c0a69'
         '1ac0f03120b6e157aa874dc28f6579fe')

package() {
  cd "$srcdir/ssWired_linux_${pkgver//./}_full"
  install -Dm644 "Resources/en.UTF-8/LC_MESSAGES/localizable.mo" "$pkgdir/usr/share/sswired/Resources/en.UTF-8/LC_MESSAGES/localizable.mo"
  install -Dm755 "ssWired Libs/libRBAppearancePak.so" "$pkgdir/usr/share/sswired/ssWired Libs/libRBAppearancePak.so"
  install -m755 "ssWired Libs/libRBInternetEncodings.so" "$pkgdir/usr/share/sswired/ssWired Libs/libRBInternetEncodings.so"
  install -m755 "ssWired Libs/libRBShell.so" "$pkgdir/usr/share/sswired/ssWired Libs/libRBShell.so"
  install -m755 "ssWired Libs/SSLSocket.so" "$pkgdir/usr/share/sswired/ssWired Libs/SSLSocket.so"
  install -Dm755 ssWired "$pkgdir/usr/share/sswired/sswired"
  install -Dm644 "$srcdir/sswired.desktop" "$pkgdir/usr/share/applications/sswired.desktop"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/share/sswired/sswired" "$pkgdir/usr/bin/sswired"
}
