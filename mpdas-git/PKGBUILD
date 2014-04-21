# Maintainer: Daniel <quite@hack.org>

_name=mpdas
pkgname="${_name}-git"
pkgver=141.54aa377
pkgrel=1
pkgdesc="An AudioScrobbler client for MPD written in C++."
arch=('i686' 'x86_64')
url="https://github.com/hrkfdn/${_name}"
license=('BSD')
depends=('libmpd' 'curl')
makedepends=('git')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::git+${url}.git"
        'mpdas.service')
sha256sums=('SKIP'
            '0a98de8f69da7cb34dcc4747d4d1bb015d6065779103db724a309b400c3cccb8')
backup=('etc/mpdasrc')

pkgver() {
  cd "${srcdir}/${_name}"
  printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
pwd
  cd "${srcdir}/${_name}"
}

build() {
  cd "${srcdir}/${_name}"
  make PREFIX=/usr CONFIG=/etc
}

package() {
  cd "${srcdir}/${_name}"

  make install PREFIX=${pkgdir}/usr MANPREFIX=${pkgdir}/usr/share/man/man1

  install -Dm644 ../mpdas.service ${pkgdir}/usr/lib/systemd/system/mpdas.service
  install -Dm644 mpdasrc.example ${pkgdir}/etc/mpdasrc
}

# vim:set ts=2 sw=2 et:
