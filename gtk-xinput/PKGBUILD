# Maintainer: MCMic <come.bernigaud@laposte.net>

pkgname=gtk-xinput
pkgver=0.1
pkgrel=2
pkgdesc="A gtk interface for adding and managing cursors throught xinput"
arch=('any')
url="http://forum.ubuntu-fr.org/viewtopic.php?pid=3511081#p3511081"
license=('GPL3')
groups=()
depends=('python' 'pygtk' 'libglade')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('gtk-xinput' 'README' 'gtk-xinput.py' 'gtk-xinput.glade')
noextract=()
md5sums=('1aacea651f6564a74e0b0d260823de85'
         'a8efd5d45c96abff43505e74310d0a6b'
         '83d6d02a55d1b898dbb0c67e860ab42c'
         'c5b2d2913b9466af2ac3588822601c75') #generate with 'makepkg -g'


build() {
	mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/$pkgname/src

    install -D -m755 gtk-xinput $pkgdir/usr/bin/
    chmod +x $pkgdir/usr/bin/gtk-xinput
    install -D -m755 gtk-xinput.py $pkgdir/usr/share/$pkgname/src
    install -D -m755 gtk-xinput.glade $pkgdir/usr/share/$pkgname/src
    cp README $pkgdir/usr/share/$pkgname/
}
