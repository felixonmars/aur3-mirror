# Maintainer: Filippov Aleksey <sarum9in@gmail.com>
pkgname=yandex.contest.invoker-git
pkgver=20120914
pkgrel=1
pkgdesc="Yandex.Contest.Invoker"
arch=('i686' 'x86_64')
url="https://github.com/sarum9in/yandex_contest_invoker"
license=('GPL')
groups=()
depends=('boost-libs' 'yandex.contest.common-git' 'yandex.contest.system-git')
makedepends=('git' 'boost')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('lxc.conf' 'yandex-contest-invoker.sh')
noextract=()
md5sums=('d8705c86e2b90fffb338a2ab85c2ede0'
         '035bc83489dbed92e8bed93b2915c002')

_gitroot="git://github.com/sarum9in/yandex_contest_invoker.git"
_gitname="invoker"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

check() {
  cd "$srcdir/$_gitname-build/build"
  #make test
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install
  install -m 644 -D "$srcdir/lxc.conf" "$pkgdir/etc/yandex/contest/invoker/lxc.conf"
  sed -r "s|__ARCH__|$CARCH|" -i "$pkgdir/etc/yandex/contest/invoker/lxc.conf"
  install -m 755 -D "$srcdir/yandex-contest-invoker.sh" "$pkgdir/etc/profile.d/yandex-contest-invoker.sh"
  install -d "$pkgdir/var/lib/yandex/contest/invoker/lxc"
}
