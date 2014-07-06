# Maintainer: David Becker <david dot becker at gmx dot org>

pkgname=princessrl
pkgver=1.04
pkgrel=2
pkgdesc="PrincessRL is a roguelike inspired by the Princess Maker series of games"
source=("http://flend.net/files/princessrl-linux-v104.zip")
md5sums=('bff5a71b090e8307ef4c2667675ea077')
license=('unknown')
url="http://flend.net/princessrl/"
arch=('i686')
depends=('mono' 'sdl')

build() {
cat > princessrl << "EOF"
#!/bin/bash
cd /opt/princessrl
mono ./PrincessRL.exe
EOF
}

package() {
install -dm775 "${pkgdir}/opt/princessrl"
chown :games "${pkgdir}/opt/princessrl"
install -dm757 "${pkgdir}/opt/princessrl/logs"
install -Dm755 "${srcdir}/princessrl-linux/PrincessRL.exe" "${pkgdir}/opt/princessrl/PrincessRL.exe"
install -Dm644 "${srcdir}/princessrl-linux/libSDL.so" "${pkgdir}/opt/princessrl/libSDL.so"
install -Dm644 "${srcdir}/princessrl-linux/libtcod.so" "${pkgdir}/opt/princessrl/libtcod.so"
install -Dm644 "${srcdir}/princessrl-linux/libtcodWrapper.dll" "${pkgdir}/opt/princessrl/libtcodWrapper.dll"
install -Dm644 "${srcdir}/princessrl-linux/readme.txt" "${pkgdir}/opt/princessrl/readme.txt"
install -Dm644 "${srcdir}/princessrl-linux/tallfont.png" "${pkgdir}/opt/princessrl/tallfont.png"

install -d "${pkgdir}/usr/bin"
install -Dm755 "${srcdir}/princessrl" "${pkgdir}/usr/bin/"
}

