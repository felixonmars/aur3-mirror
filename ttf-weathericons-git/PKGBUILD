# Maintainer: Lee Hanbury <hi at kryps dot in>

pkgname=ttf-weathericons-git
pkgver=v1.3.2.r6.gdfd7a3c
pkgrel=1
pkgdesc="189 weather themed icons inspired by Font Awesome and ready for Bootstrap"
url="http://erikflowers.github.io/weather-icons/"
arch=('any')
license=('various')
depends=('fontconfig' 'xorg-font-utils')
makedepends=(git)


install=font.install
source=('git+http://github.com/erikflowers/weather-icons.git')
md5sums=('SKIP')


_gitname="weather-icons"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
package() {
  cd ${srcdir}/${_gitname}/font
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  find . -type f -name \*.ttf -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/fonts/TTF" \;
}

