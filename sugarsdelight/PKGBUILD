# Maintainer: AlexanderR <alexander r at gmx com>

pkgname=sugarsdelight
pkgver=1
pkgrel=2
pkgdesc="English version of free Japaness uri (Hentai) game"
arch=('any')
url='http://neko-soft.blogspot.com/p/downloads.html'
license=('custom')
depends=('renpy')
makedepends=('icoutils')
options=(!strip)
source=(http://dl.dropbox.com/u/3851519/SugarsDelight-all.zip
        sugarsdelight.desktop
        sugarsdelight.sh
        python2.patch)

build() {
  cd "$srcdir/SugarsDelight-all"

  patch -p1 -i ../python2.patch

  wrestool -x --output=. -t14 SugarsDelight.exe
}

package() {
  cd "$srcdir/SugarsDelight-all"

  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r game/* "$pkgdir/usr/share/$pkgname"
  install -m644 "SugarsDelight.py" "$pkgdir/usr/share/$pkgname"

  install -D -m644 'README.html' "$pkgdir/usr/share/doc/$pkgname/README.html"
  install -D -m644 'README.html' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"

  install -D -m755 "$srcdir/${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"

  install -D -m644 SugarsDelight.exe_14_1_0.ico "$pkgdir/usr/share/pixmaps/${pkgname}.ico"
  install -D -m644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}

md5sums=('64fa988e83ab0bee77f7f99bd9cc9276'
         'de72484132d90cd63cab4042d11043ff'
         '9087f2d28602a2d9f71f0f6d231bcccd'
         '9bb694b853dda1ab7881cf7cdc8e4db9')

# vim:set ts=2 sw=2 et:
