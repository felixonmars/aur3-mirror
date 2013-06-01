# Maintainer: James Reed <supplantr at archlinux dot info>

_gitname=tc-play
_basename=tcplay
pkgname=tcplay-git
pkgver=1.0+11+g96b0d9d
pkgrel=1
pkgdesc='A free and simple TrueCrypt implementation based on dm-crypt.'
arch=('i686' 'x86_64')
url='https://github.com/bwalex/tc-play'
license=('BSD')
depends=('libgcrypt' 'util-linux' 'device-mapper')
makedepends=('git')
provides=('tcplay')
conflicts=('tcplay')
options=(!buildflags)
source=('git://github.com/bwalex/tc-play.git#branch=master')
sha1sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe | sed 's/^v//;s/-/+/g'
}

build() {
  cd "$srcdir/$_gitname"

  make PBKDF_BACKEND=gcrypt -f Makefile.classic
}

package() {
  cd "$srcdir/$_gitname"

  install -Dm755 ${_basename} "${pkgdir}/usr/bin/${_basename}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_basename}/LICENSE"
  install -Dm644 ${_basename}.3 "${pkgdir}/usr/share/man/man3/${_basename}.3"
  install -Dm644 ${_basename}.8 "${pkgdir}/usr/share/man/man8/${_basename}.8"
}
