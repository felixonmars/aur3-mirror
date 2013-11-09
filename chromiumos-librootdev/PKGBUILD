# Maintainer: Thomas Sowell <tom@fancydriving.org>

buildarch=1

pkgname=chromiumos-librootdev
pkgdesc="Chromium OS version of rootdev"
pkgver=R30.4537
pkgrel=1
arch=('any')
groups=('chromarchy')
url="http://git.chromium.org/gitweb/?p=chromiumos/third_party/rootdev.git;a=summary"
license=('custom:chromiumos')
_gitname='rootdev'
makedepends=('git')

source=("$_gitname::git+http://git.chromium.org/git/chromiumos/third_party/rootdev.git#branch=release-R30-4537.B")

md5sums=('SKIP')

build() {
  cd "$srcdir/$_gitname"

  make
}

package() {
  cd "$srcdir/$_gitname"

  install -D -m 644 rootdev.h ${pkgdir}/usr/include/rootdev/rootdev.h

  install -d ${pkgdir}/usr/lib
  cp -a librootdev.so* ${pkgdir}/usr/lib

  install -m 644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

