# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-tasks-git
_pkgname=tasks
pkgver=0.5.r45.g2a71f68
pkgrel=1
pkgdesc="Enhanced task app for ownCloud"
arch=('any')
url="https://github.com/owncloud/tasks"
license=('AGPL')
depends=('owncloud')
provides=('owncloud-app-tasks')
conflicts=('owncloud-app-tasks')
options=('!strip')
source=("git+https://github.com/owncloud/tasks.git")
sha512sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/tasks" "${pkgdir}/usr/share/webapps/owncloud/apps/tasks"
}
