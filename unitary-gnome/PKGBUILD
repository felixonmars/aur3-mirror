pkgname=unitary-gnome
pkgver=1.1
pkgrel=1
pkgdesc="Unity-2D Launcher for Gnome Shell"
url="http://techunit.deviantart.com/art/Unitary-Gnome-279375636"
license=('Creative Commons')
arch=('any')
depends=('gnome-shell' 'unity-2d')
install=$pkgname.install
source=("http://www.deviantart.com/download/279375636/unitary_gnome_by_techunit-d4mbzmc.zip")
md5sums=('4a19d0ee918d6bfb9b4235555e464182')

build() {
	cd $srcdir
	install -Dm644 Unity\ Gnome\ Installer/*.qml $pkgdir/usr/share/unity-2d/launcher/Launcher.qml
	install -Dm644 Unity\ Gnome\ Installer/*.desktop $pkgdir/etc/xdg/autostart/unity-2d-launcher.desktop
}
