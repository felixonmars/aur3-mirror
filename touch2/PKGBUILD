# Maintainer: Testuser_01 <arch@nico-siebler.de>

pkgname=touch2
pkgver=2
pkgrel=1
pkgdesc="Touch2 is a utility which modifies the ctime. Touch2 can be run after touch(1) or other commands."
url="http://packetstormsecurity.org/files/46410/touch2v2.c"
arch=('i686' 'x86_64')
license=('BSD')
depends=('gcc' 'coreutils')
source=("http://packetstorm.crazydog.pt/UNIX/misc/${pkgname}v${pkgver}.c")
md5sums=('df35882f1fc0937cc70fd882f2cb797d')
sha512sums=('5ddc8041d61cf3950b2789656d7c24dea4534c719b71191e5d95fdbfcb7d8ee007bdb8866f91cf267e016d45ad3e5243ad075a93cd73640a94ad2da44cbd2dec')


build() {
	mkdir -p "${pkgdir}/usr/bin/" || return 1
	gcc "${srcdir}/${pkgname}v${pkgver}.c" -o "${pkgdir}/usr/bin/touch2" || return 1
}
