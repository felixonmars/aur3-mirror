# Maintainer: Vincent Ambo <tazjin@gmail.com>
pkgname=kjell-git
pkgver=r114.8539af5
pkgrel=1
pkgdesc="An improved Erlang shell"
arch=('x86_64' 'i686') # Same as Erlang, though namcap doesn't like it
url="http://karlll.github.io/kjell/"
license=('custom:EPLICENSE')
depends=('erlang')
source=('git+https://github.com/karlll/kjell.git')
sha1sums=('SKIP') # It's a git repo

pkgver() {
  cd "$srcdir/kjell"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/kjell"
  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}/kjell"
  make configure PREFIX="${pkgdir}/opt/kjell/"
  make
}

package() {
  cd "${srcdir}/kjell"
  # Installs to /opt/kjell
  make install NO_SYMLINK=true
  install -Dm644 EPLICENCE "${pkgdir}/usr/share/licenses/kjell-git/EPLICENCE"
  install -d "${pkgdir}/usr/bin/"
  ln -s "/opt/kjell/bin/kjell" "${pkgdir}/usr/bin/kjell"
}

