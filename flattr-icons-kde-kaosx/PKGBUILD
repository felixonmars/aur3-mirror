# Maintainer: jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=flattr-icons-kde-kaosx
pkgver=0.9.7
pkgrel=1
pkgdesc="Flattr is an icon theme for Linux desktops, the set is inspired by the latest flat design trend."
url="https://github.com/KaOSx/flattr-icons-kde"
arch=('any')
license=('CC BY-NC-SA 4.0')
depends=('librsvg')
conflicts=('flattr-icons','flattr-icon-theme','flattr-icon-theme-git' 'flattr-icons-kde-kaosx-git')
provides=('flattr-icon-theme')


# NOTE : update md5sum with 'updpkgsums' command
md5sums=('fbec362f296822cb43acaf6881d18b01')
source=("https://github.com/KaOSx/flattr-icons-kde/archive/$pkgver.tar.gz")

package() {
  cd "$srcdir/flattr-icons-kde-$pkgver"
  install -dm755 "$pkgdir/usr/share/icons/Flattr"
  rm -rf {.git,.gitignore,CONTRIBUTORS,COPYING,CREDITS,LICENSE.txt,README.md}
  cp -r . "$pkgdir/usr/share/icons/Flattr/"
  }



