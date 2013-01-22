# Maintainer: Pierre Carrier <pierre@gcarrier.fr>
pkgname=ttf-android
pkgver=4.2.1_r1
_reponame=platform_frameworks_base
_tagname=android-$pkgver
pkgrel=1
pkgdesc="All fonts from Android"
arch=(any)
url=https://android.googlesource.com/
license=(Apache)
depends=(fontconfig xorg-fonts-encodings xorg-font-utils)
conflicts=(ttf-droid ttf-roboto)
install=$pkgname.install
source=(https://github.com/android/$_reponame/archive/$_tagname.tar.gz)
md5sums=('4de07b64ad04d0b12817ac89cac7257b')

package() {
  cd "$srcdir"/$_reponame-$_tagname
  install -d "$pkgdir"/usr/share/fonts/TTF/
  install -m644 data/fonts/*.ttf "$pkgdir"/usr/share/fonts/TTF/
}

# vim:set ts=2 sw=2 et:
