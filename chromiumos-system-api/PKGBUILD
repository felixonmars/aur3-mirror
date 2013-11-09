# Maintainer: Thomas Sowell <tom@fancydriving.org>

buildarch=1

pkgname=chromiumos-system-api
pkgdesc="Chromium OS D-Bus constants and definitions"
pkgver=R30.4537
pkgrel=1
arch=('any')
groups=('chromarchy')
url="http://git.chromium.org/gitweb/?p=chromiumos/platform/system_api.git;a=summary"
license=('custom:chromiumos')
_gitname='rootdev'
makedepends=('git')

source=(LICENSE
        "$_gitname::git+http://git.chromium.org/git/chromiumos/platform/system_api.git#branch=release-R30-4537.B")

md5sums=('87dd8458232da630f5617873d42d8350'
         'SKIP')

package() {
  cd "$srcdir/$_gitname"

  install -d ${pkgdir}/usr/include/chromeos
  cp -ar dbus ${pkgdir}/usr/include/chromeos

  install -m 644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/license/${pkgname}/LICENSE
}

