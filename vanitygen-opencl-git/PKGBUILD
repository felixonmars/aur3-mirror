# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Christos Nouskas <nous at archlinux dot us>

pkgname=vanitygen-opencl-git
pkgver=20121024
pkgrel=1
pkgdesc="Bitcoin vanity address generator written in C"
arch=('i686' 'x86_64')
depends=('opencl-headers' 'openssl' 'pcre')
makedepends=('git')
url="https://github.com/samr7/vanitygen"
license=('AGPL3')
source=(git+https://github.com/samr7/vanitygen)
sha256sums=('SKIP')
provides=('vanitygen')
conflicts=('vanitygen')

pkgver() {
  cd ${pkgbase%-opencl*}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgbase%-opencl*}

  msg 'Fixing calc_addrs location...'
  sed -i s"|calc_addrs.cl|/usr/share/vanitygen/calc_addrs.cl|" oclengine.c
}

package() {
  cd ${pkgbase%-opencl*}

  msg 'Building...'
  make all

  msg 'Installing executables...'
  install -D -m755 vanitygen $pkgdir/usr/bin/vanitygen
  install -D -m755 keyconv $pkgdir/usr/bin/keyconv
  install -D -m755 oclvanitygen $pkgdir/usr/bin/oclvanitygen
  install -D -m755 oclvanityminer $pkgdir/usr/bin/oclvanityminer

  msg 'Installing calc_addrs.cl (needed for oclvanitygen)...'
  install -D -m644 calc_addrs.cl $pkgdir/usr/share/vanitygen/calc_addrs.cl

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
