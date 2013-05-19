# Maintainer: Rafael Beraldo <rafaelluisberaldo@gmail.com>

pkgname=tube2cast
pkgver=1
pkgrel=1
pkgdesc="Stream YouTube videos to your mobile devices"
arch=('any')
url=('https://github.com/rberaldo/tube2cast')
license=('GPL')
depends=('youtube-dl' 'python')
makedepends=('git')
md5sums=('SKIP')
source=($pkgname::git+git://github.com/rberaldo/tube2cast.git)

package() {
  cd "${srcdir}/${pkgname}"

  install -v -D -m 0755 tube2cast.sh "${pkgdir}/usr/bin/tube2cast.sh"
}

# vim:set ts=2 sw=2 et:
