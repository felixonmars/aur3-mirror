# Maintainer: T-T tom.vycital@gmail.com
pkgname="t-t_pacmanshorter"
pkgver=0.0.1
pkgrel=2
pkgdesc="sudo pacman -S .... → - S ...."
url="http://www.example.free"
arch=("x86_64" "i686")
license=("BSD")
depends=("bash" "pacman")
optdepends=("sed")
makedepends=("tar" "xz")
md5sums=("")

package() {
echo '#!/bin/bash

if [ "$1" == "Ql" ]; then
	sudo pacman -$@
	echo "----------------------------------------------------------------"
	sudo pacman -$@ | grep /bin/
else
	sudo pacman -$@
fi
' > "${srcdir}/-"
install --mode=755 -D "-" "${pkgdir}/usr/bin/-"
}

# vim:set ts=2 sw=2 et: