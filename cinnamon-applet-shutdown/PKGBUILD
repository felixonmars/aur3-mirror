# Contributor: Ner0
# Maintainer: Pablo Lluch <pablo.lluch@gmail.com>

pkgname=cinnamon-applet-shutdown
pkgver=1.4
pkgrel=3
pkgdesc="An applet that will help you Shutdown, Suspend, Hibernate, Restart, Logout and Lock your screen with a single click"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/49"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon-screensaver')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/98WL-ZYQC-A1B9.zip" "cinnamon-applet-shutdown.patch")
md5sums=('eba29218f98f279a88c5604fc12ea8d3' 'c9f6946a492613004a61d6695ce41175')

build() {
	cd $srcdir/ShutdownApplet@shelley
	patch -Np1 -i ../cinnamon-applet-shutdown.patch
}

package() {  
  find ShutdownApplet\@shelley/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}
