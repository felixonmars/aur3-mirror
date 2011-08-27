# Maintainer: fnord0 <fnord0 at riseup dot net>

pkgname=lib32-ciscos
_pkgname32=${pkgname/lib32-/}
pkgver=1.3
pkgrel=1
_pkgrel32=1
pkgdesc="Scans class A, B, and C networks for cisco routers which have telnet open and have not changed the default password from cisco."
license=(GPL)
url="http://www.packetstormsecurity.org"
arch=(x86_64)
depends=(gcc-multilib lib32-gcc-libs)
groups=(lib32)
source=(http://packetstormsecurity.org/cisco/ciscos.c)
md5sums=('c8d0bd0b1965c7973a76097d542488d6')

build() {
  cd "${startdir}"

  install -d ${pkgdir}/opt/lib32/usr/share/${pkgname} || return 1
  install -d ${pkgdir}/opt/lib32/usr/bin || return 1
  gcc -o ciscos ciscos.c || return 1
  install -Dm755 ${startdir}/${_pkgname32} ${pkgdir}/opt/lib32/usr/share/${pkgname}/${_pkgname32} || return 1
  install -Dm644 ${startdir}/${_pkgname32}.c ${pkgdir}/opt/lib32/usr/share/${pkgname}/${_pkgname32}.c || return 1
  install -Dm755 ${startdir}/${_pkgname32} ${pkgdir}/opt/lib32/usr/bin/${_pkgname32} || return 1
}
