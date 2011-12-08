# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=gnalert
pkgver=1.2.0
pkgrel=7
pkgdesc="A simple notifier"
arch=('i686' 'x86_64')
url="http://github.com/foutrelis/gnalert"
license=('GPL')
depends=('pygtk' 'python2-dateutil' 'desktop-file-utils')
install=gnalert.install
source=(http://cloud.github.com/downloads/foutrelis/$pkgname/$pkgname-$pkgver.tar.gz
        gnalert
        gnalert.desktop)
sha256sums=('d4f6ee6969de27f56a84fa090066460cfff1e29765ef1f20f3bf59ee23ab9951'
            '6d66bdab8881dc42a00251161b05b8a9333badd11df49369b007370237053fa2'
            '9d2dbee8650ec0e2573268bea88aaf3962eff5ce077f0bfb220ffca58df800c8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/share"
  cp -r src "$pkgdir/usr/share/gnalert"
  chmod -x "$pkgdir/usr/share/gnalert/gnalert.py"
  install -D -m644 "$srcdir/gnalert.desktop" "$pkgdir/usr/share/applications/gnalert.desktop"
  install -D -m755 "$srcdir/gnalert" "$pkgdir/usr/bin/gnalert"
}

# vim:set ts=2 sw=2 et:
