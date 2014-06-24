# $Id$
# Maintainer: Connor Prussin <cprussin@bci-incorporated.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Evan LeCompte <evanlec@gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Wesley Merkel <ooesili at gmail.com>
# Contributor: Michael Reed <supertron421@gmail.com>

_pkgname=htop
pkgname=$_pkgname-solarized-vi
pkgver=1.0.3
pkgrel=2
pkgdesc="Interactive process viewer with solarized patch and vi keybindings patch"
arch=('i686' 'x86_64')
url="http://htop.sourceforge.net/"
license=('GPL')
depends=('ncurses')
makedepends=('python2')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop' 'htop-vi' 'htop-solarized')
options=('!emptydirs')
source=("http://hisham.hm/$_pkgname/releases/$pkgver/$_pkgname-$pkgver.tar.gz"
       'htop-1.0.3-solarized.patch'
       'htop-1.0.3-vi.patch')
sha512sums=('4c5c784b093bcad06eb2e8d8bb215e14f6e838a3d47d8da8402344c270c1724f85d0bcde2899571ba5d0e5a02274a0c3390a76fed61785b2604b51351f08f232'
            '1e1eed2ca1f1d7908f125dd04165b84c722e23d45df4162c98e521312b7736daa88eca70e92f181d2058ad686ed0e4bdcaf95de079d1c04cbd0ed125dd341223'
            '587a29d96e08f66c3b46fdf0327166500df156233cc9e00b8b8f87e31e04350f075e6565014991ade8342e31ec6cc15d49bc4650d1ec6822e2c54cb62e6a76dc')

prepare() {
  cd "$_pkgname-$pkgver"

  sed -i 's|ncursesw/curses.h|curses.h|' RichString.[ch] configure
  sed -i 's|python|python2|' scripts/MakeHeader.py

  # Solarized patch: https://gist.github.com/ooesili/11292686
  patch -N -i ../htop-1.0.3-solarized.patch

  # Vi keybindings patch: https://gist.github.com/ooesili/11292865
  patch -N -i ../htop-1.0.3-vi.patch
}

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
      --prefix=/usr \
      --enable-unicode \
      --enable-openvz \
      --enable-vserver \
      --enable-cgroup \
      --enable-oom

  make
}

package() {
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install
}
