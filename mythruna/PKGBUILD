# Maintainer: Sean Wright <seanwright2@gmail.com>

pkgname=mythruna
pkgver=20120627
pkgrel=2
pkgdesc="A role-crafting game - What will your story be?"
arch=(any)
license=('custom')
url="http://mythruna.com"
depends=('java-runtime' 'xorg-server-utils' 'openal')
noextract=('Mythruna-$pkgver.jar')
source=(mythruna http://mythruna.com/downloads/Mythruna-$pkgver-Linux.zip mythruna.install mythruna.desktop mythruna.png)
md5sums=('7c69e4f63b57e41adb98def47170d99d'
         '2b16dbb6443d0fe12b3340d98a83bfcb'
         '6c60dd9264061318a022e535dcdcae82'
         '7b74fe992d1c0253befbccdfac32b271'
         '29924a44c2f264214862c2c6dc2a3811')

install='mythruna.install'

package() {
    cd "$srcdir" || return 1

# directories
mkdir ${pkgdir}/usr/
mkdir ${pkgdir}/usr/share/
mkdir ${pkgdir}/usr/share/pixmaps/
mkdir ${pkgdir}/usr/share/mythruna/
mkdir ${pkgdir}/usr/bin/

# launch executable and menu entry
install -D -m755 "${srcdir}/mythruna"              "${pkgdir}/usr/bin/"
install -D -m644 "${srcdir}/mythruna.desktop"      "${pkgdir}/usr/share/applications/mythruna.desktop"
install -D -m644 "${srcdir}/mythruna.png"          "${pkgdir}/usr/share/pixmaps/mythruna.png"

# game installation
#!/bin/sh
if [ -f /usr/share/mythruna/ ]; then
rm /usr/share/mythruna/
fi;
cp -avr ${srcdir}/lib/                              ${pkgdir}/usr/share/mythruna/
install -D -m644 "${srcdir}/Mythruna-$pkgver.jar"  "${pkgdir}/usr/share/mythruna/Mythruna-$pkgver.jar"
install -D -m755 "${srcdir}/Mythruna-$pkgver.sh"   "${pkgdir}/usr/share/mythruna/Mythruna-$pkgver.sh"
}
