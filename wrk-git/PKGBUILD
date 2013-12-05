# Maintainer: Trustin Lee <t@motd.kr>
# Contributor: Pierre Carrier <pierre@gcarrier.fr>
pkgname=wrk-git
_pkgname=wrk
pkgver=34.7763ce3
pkgrel=2
pkgdesc='Modern HTTP benchmarking tool (with --pipeline patch)'
arch=('i686' 'x86_64')
url="https://github.com/wg/${_pkgname}"
license=('Apache')
makedepends=('git')
source=("git+https://github.com/wg/${_pkgname}.git"
        'pipeline.patch')
sha1sums=('SKIP'
          '2ec80f167e1e424ea53d4b47808b54a250d115e2')

pkgver() {
  cd "${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${_pkgname}"
  patch -p1 < ../pipeline.patch
}

build() {
  cd "${_pkgname}"
  make CFLAGS="$CFLAGS -std=gnu99 -Ideps/luajit/src" -j1
}

package() {
  cd "${_pkgname}"
  install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
