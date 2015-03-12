# Maintainer: Aliaksey Artamonau <aliaksiej.artamonau@gmail.com>

pkgname=darcs-to-git
pkgver=r144.0c4351b
pkgrel=1
pkgdesc="Darcs to Git converter"
arch=('any')
url="https://github.com/purcell/darcs-to-git"
license=('MIT')
depends=('darcs' 'git' 'ruby' 'ruby-iconv')
makedepends=('git')
source=('darcs-to-git::git+git://github.com/purcell/darcs-to-git.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


package() {
  cd "$srcdir/$pkgname"

  install -d -m755 ${pkgdir}/usr/bin || return 1
  install -m755 -t ${pkgdir}/usr/bin darcs-to-git || return 1

  install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname} || return 1
  install -m644 -t ${pkgdir}/usr/share/licenses/${pkgname} LICENSE || return 1

  install -d -m755 ${pkgdir}/usr/share/doc/${pkgname} || return 1
  install -m644 README.markdown \
                ${pkgdir}/usr/share/doc/${pkgname}/README || return 1
}
