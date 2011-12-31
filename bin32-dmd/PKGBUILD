# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Chris Brannon <cmbrannon79 at gmail dot com>
# Contributor: Andrea Scarpino <andrea at archlinux dot org>
# Contributor: Anders Bergh <anders1 at gmail dot com>
# Contributor: Alexander Fehr <pizzapunk at gmail dot com>

pkgname=bin32-dmd
_r_name=dmd
pkgver=1.066
pkgrel=1
pkgdesc="The Digital Mars D compiler."
arch=('x86_64')
url="http://www.digitalmars.com/d/1.0/"
source=(http://ftp.digitalmars.com/${_r_name}.${pkgver}.zip)
install='dmd.install'
provides=('d-compiler')
license=('custom')
options=('!strip')
depends=('lib32-gcc-libs' 'lib32-glibc')
optdepends=('lib32-libphobos: D standard runtime library')
md5sums=('fd2c3f8dd46d0fe4597e9d96b4ab86b2')

package() {
  # Copy the license.
  install -Dm644 "${srcdir}"/dmd/license.txt "${pkgdir}"/usr/share/licenses/dmd/LICENSE

  install -Dm755 "${srcdir}"/dmd/linux/bin/dmd "${pkgdir}"/usr/bin/dmd
  install -Dm755 "${srcdir}"/dmd/linux/bin/dumpobj "${pkgdir}"/usr/bin/dumpobj
  install -Dm755 "${srcdir}"/dmd/linux/bin/obj2asm "${pkgdir}"/usr/bin/obj2asm
  install -Dm755 "${srcdir}"/dmd/linux/bin/rdmd "${pkgdir}"/usr/bin/rdmd

  for x in "${srcdir}"/dmd/man/man1/*.1; do
    install -Dm644 "$x" "${pkgdir}"/usr/share/man/man1/$(basename "${x}")
  done

  for x in "${srcdir}"/dmd/man/man1/*.5; do
    install -Dm644 "$x" "${pkgdir}"/usr/share/man/man5/$(basename "${x}")
  done
}

