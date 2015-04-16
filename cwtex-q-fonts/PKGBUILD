# Maintainer: Ma Jiehong <majiehong.com/pages/contact.html>
pkgname=cwtex-q-fonts
pkgver=0.4
pkgrel=1
pkgdesc="Set of five Chinese truetype fonts derived from cwTeX"
arch=('i686' 'x86_64')
url="https://github.com/l10n-tw/cwtex-q-fonts"
license=('GPL2')
depends=('fontconfig' 'xorg-font-utils')
conflicts=()
install=ttf.install

source=("https://doc-14-c8-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/75oqb50iiqd5drb6893n1ka270df28gr/1429092000000/15736271093686307831/*/0B0E2FRIvjDDoMDFYZUNNeTRlT1U?e=download")
md5sums=('08a60a034a93fb5b8b7f03e40a321c92')

build() {
  echo
}

package() {
  cd "$srcdir/$pkgname-v04"
  install -Dm644 cwTeXQFangsong-Medium.ttf "$pkgdir/usr/share/fonts/cwttf/cwTeXQFangsong-Medium.ttf"
  install -Dm644 cwTeXQHei-Bold.ttf "$pkgdir/usr/share/fonts/cwttf/cwTeXQHei-Bold.ttf"
  install -Dm644 cwTeXQKai-Medium.ttf "$pkgdir/usr/share/fonts/cwttf/cwTeXQKai-Medium.ttf"
  install -Dm644 cwTeXQMing-Medium.ttf "$pkgdir/usr/share/fonts/cwttf/cwTeXQMing-Medium.ttf"
  install -Dm644 cwTeXQYuan-Medium.ttf "$pkgdir/usr/share/fonts/cwttf/cwTeXQYuan-Medium.ttf"
}
