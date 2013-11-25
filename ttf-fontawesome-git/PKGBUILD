# Maintainer: Sebastian Zań <sz at subey dot net>

pkgname=ttf-fontawesome-git
pkgver=v4.0.3.r0.g0373b63
pkgrel=1
pkgdesc="The iconic font designed for Bootstrap"
url="http://fontawesome.io/"
arch=('any')
license=('various')
depends=('fontconfig' 'xorg-font-utils')
makedepends=(git)


install=font.install
source=('git+http://github.com/FortAwesome/Font-Awesome.git')
md5sums=('SKIP')


_gitname="Font-Awesome"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
package() {
  cd ${srcdir}/${_gitname}/fonts
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  find . -type f -name \*.ttf -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/fonts/TTF" \;
}

