# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=kdevelop-mercurial-git
pkgver=141.b254a23
pkgrel=1
pkgdesc="Mercurial support for KDevelop"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/devtools/plugins/kdev-mercurial"
license=('GPL')
depends=('kdevelop-git' 'mercurial')
conflicts=('kdevelop-extra-plugins-mercurial-git')
provides=('kdevelop-extra-plugins-mercurial-git')
replaces=('kdevelop-extra-plugins-mercurial-git')
makedepends=('cmake' 'automoc4' 'git')
source=('mercurial::git+git://anongit.kde.org/kdev-mercurial')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/mercurial"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/mercurial"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/mercurial"
  make DESTDIR="$pkgdir" install
}
