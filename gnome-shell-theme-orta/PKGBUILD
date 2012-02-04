pkgname=gnome-shell-theme-orta
pkgver=3.2
pkgrel=2
pkgdesc="This is a GNOME Shell theme based on the Orta GTK2 theme."
url="https://half-left.deviantart.com/art/GNOME-Shell-Orta-207047273"
license=('GPL3')
arch=('any')
depends=('gnome-shell>=3.2.0')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/207047273/gnome_shell___orta_by_half_left-d3f9qp5.zip")
md5sums=('7670047a31b43709ff8dac0d93976c9b')

build() {
	cd $srcdir
	install -dm755 $pkgdir/usr/share/themes/Orta-$pkgver/gnome-shell
	bsdtar -x -f GNOME-Shell-Orta-$pkgver.zip
	install -Dm644 Orta-$pkgver/gnome-shell/* $pkgdir/usr/share/themes/Orta-$pkgver/gnome-shell/
}
