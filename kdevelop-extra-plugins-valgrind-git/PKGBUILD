# Maintainer: prettyvanilla <prettyvanilla@lavabit.com>

pkgname=kdevelop-extra-plugins-valgrind-git
pkgver=20120112
pkgrel=1
pkgdesc="Full integration of the valgrind suite for KDevelop4"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/devtools/plugins/kdev-valgrind"
license=('GPL')
groups=('kdevelop-extra-plugins')
depends=('kdevplatform-git')
optdepends=('kdevelop-git' 'valgrind')
makedepends=('git' 'cmake' 'automoc4')
provides=()
conflicts=()
md5sums=()

_gitroot="git://anongit.kde.org/kdev-valgrind"
_gitname="kdev-valgrind"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed' \
        -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  # fix KDevelop-Version in desktop-file for the plugin to work in current kdevelop-git
  sed -i 's|X-KDevelop-Version=12$|X-KDevelop-Version=14|' kdevvalgrind.desktop

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
