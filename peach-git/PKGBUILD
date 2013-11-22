# Contributor: orange.toaster <orange.toaster at gmail dot com>
pkgname=peach-git
pkgver=v3.1.54.0.g3ef81c1
pkgrel=2
pkgdesc="A cross-platform fuzzing framework written in C-sharp"
arch=('x86_64')
url="http://peachfuzzer.com/"
license=('MIT')
depends=('mono' 'python2' 'pin')
source=("$pkgname"::"git://git.code.sf.net/p/peachfuzz/code"
	"peach.patch"
	"peach"
	"LICENCE"
	)
sha512sums=('SKIP'
	'a23c904240aa6bbf0a4f94d64cd050b6281a296290097598b4cd6b048213bae6129d08cc76a5d31f056123c093a4704ce58dfc3a96fc80661e88e3e484f7a028'
	'5b598dd2b28306dda912759bfa8c17a6242e7fd0dcd0133825c213aa420f45f60116e7dca6d5dfb5d50d84485f3fe6bb355bd25aa7acb79cc0de0af274509092'
	'c6fe2e0fd5fe6af67ab683f995e13eec0df4825b73ec61bd8f2b13306c0fe67d2f18d559313548569b7f71f471507e7d5e32deada917ed70983606069de8a81c'
	)

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(git describe --long)"
  echo "${ver//-/.}"
}

build() {
  cd "$srcdir/$pkgname"
  patch -p1 -i "$srcdir/peach.patch"
  ./waf configure
  ./waf install -j4 --variant linux_x86_64_release
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/opt/peach
  rm output/linux_x86_64_release/bin/pin -Rf
  cp output/linux_x86_64_release/* "$pkgdir/opt/peach/" -R
  install -D -m644 "$srcdir/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
  install -D -m 755 "$srcdir/peach" "$pkgdir/usr/bin/peach"
}
