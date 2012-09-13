# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=strace-patched
_pkgname=strace
pkgver=4.7
pkgrel=3
pkgdesc="A useful diagnositic, instructional, and debugging tool - patched for two-digit OS numbers"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/strace/"
license=('custom')
depends=('perl')
provides=('strace')
conflicts=('strace')
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-$pkgver.tar.xz"
        "strace-version.patch")
md5sums=('6054c3880a00c6703f83b57f15e04642'
         'ab5838629612cea7dbae3fce92670acb')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../../strace-version.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
