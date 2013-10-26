# Maintainer: Jon Smith <catalyst4000 [at] gmail [dot] com>
pkgname=eamon-deluxe
pkgver=5.0Beta4
pkgrel=2
pkgdesc="Eamon Deluxe is an enhanced and expanded variation of the classic Eamon gaming system."
arch=('any')
url="http://www.eamonag.org/"
license=('GPL')
depends=(dosbox)
install=install
changelog=
source=($pkgname-$pkgver.zip::http://www.eamonag.org/programs/EamonDX/Eamon_Deluxe_50_Beta4-X.zip)
noextract=($pkgname-$pkgver.zip)
md5sums=('9d5d24b6e2a8e2fa33ebb9ebc372c8ef')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
    bsdtar -xf "../$pkgname-$pkgver.zip" --strip-components 1
    sed -i "s|/usr/local/share/edx|/opt/eamon-deluxe|g" edx/*.{conf,desktop}
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir "$pkgdir/opt"
  cp -a "edx/" "$pkgdir/opt/eamon-deluxe/"

  find "$pkgdir/opt/eamon-deluxe/C" -exec chown :games {} \;
  find "$pkgdir/opt/eamon-deluxe/C" -exec chmod g+w {} \;

  install -Dm644 "$pkgdir/opt/eamon-deluxe/eamondeluxe.desktop" \
    "$pkgdir/usr/share/applications/eamondeluxe.desktop"
  
  install -Dm644 "$pkgdir/opt/eamon-deluxe/eamondeluxe_sd.desktop" \
    "$pkgdir/usr/share/applications/eamondeluxe_sd.desktop"
}

# vim: set ts=2 sw=2 et:
