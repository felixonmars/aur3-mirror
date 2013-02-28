# Maintainer: TDY <tdy@archlinux.info>

pkgname=rkflashtool-git
pkgver=20130227
pkgrel=1
pkgdesc="A tool for flashing rk2808, rk2818, and rk2918 based tablets"
arch=('i686' 'x86_64')
url="https://github.com/dpavlin/android-command-line/tree/master/rkflashtool"
license=('BSD')
depends=('libusbx')
makedepends=('git')
provides=('rkflashtool')
conflicts=('rkflashtool')

_gitroot=https://github.com/dpavlin/android-command-line.git
_gitname=android-command-line

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build/rkflashtool

  make
}

package() {
  cd "$srcdir/$_gitname-build/rkflashtool"
  install -Dm755 rkflashtool "$pkgdir/usr/bin/rkflashtool"
  install -Dm644 rkflashtool.c "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  sed -i '1,2d;25,$d' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
