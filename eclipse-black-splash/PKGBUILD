# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=eclipse-black-splash
pkgver=1.1
pkgrel=1
pkgdesc="Black splash screen for Eclipse"
arch=('any')
url="http://www.wezside.co.za/blog/i-like-black/"
license=('unknown' 'BSD')
depends=('eclipse' 'python')
install=setupsplash.install
source=('setupsplash.py'
        'http://www.wezside.co.za/workspace/uploads/blog/i-like-black/EclipseThemeBlack.zip')
sha1sums=('9eca5e73f3440b97b6caf2fa4adb13cff8bf820e'
          'cda8c0a3701bfa0da42f38692ee9f5e2054b19e3')
conflicts=('eclipse-motivational-splash' 'eclipse-pony-splash')

package() {
  cd "$srcdir"

  install -Dm755 setupsplash.py \
    "$pkgdir/usr/bin/setup_eclipse_splash"
  install -Dm644 splash.bmp \
    "$pkgdir/usr/share/eclipse-splash/splash.bmp"
}

# vim:set ts=2 sw=2 et:
