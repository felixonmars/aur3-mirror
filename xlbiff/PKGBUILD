# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=xlbiff
pkgver=4.1
pkgrel=1
pkgdesc="X Literate Biff, a mail notifier"
arch=(i686 x86_64)
url="http://www.edsantiago.com/xlbiff/"
license=('custom')
groups=()
depends=(libxaw)
makedepends=(imake)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($url/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('796970ebe45de11f08dcce61e25da666')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  xmkmf -DXmhLibDir=/etc/nmh || return 1
  make || return 1
  sed -n 2,30p xlbiff.c >LICENSE || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D -m755 xlbiff "${pkgdir}/usr/bin/xlbiff" || return 1
  install -D -m644 xlbiff.man "${pkgdir}/usr/share/man/man1/xlbiff.1" || return 1
  install -D -m644 xlbiff.form "${pkgdir}/etc/nmh/xlbiff.form" || return 1
  install -D -m644 XLbiff.ad "${pkgdir}/usr/lib/X11/app-defaults/XLbiff.ad" || return 1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
