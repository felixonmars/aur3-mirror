# Maintainer: t.oster

pkgname=cinnamon-applet-ssh-launcher
pkgver=1.0
pkgrel=1
pkgdesc="Allow Quick Connect and add quick connected hosts to config"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/93"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/applets/OX9N-9FIQ-I1WH.zip')

md5sums=('c639ca3e0567f7748b742723f6af367c')
_applet=sshlauncher@sumo

build() {
  mv $srcdir/cinnamon-ssh-launcher/* $srcdir/
  rm -r $srcdir/cinnamon-ssh-launcher
  cd $srcdir/$_applet
  rm -f *~
}

package() {
  cd $srcdir/$_applet
  install -dpm755 $pkgdir/usr/share/cinnamon/applets/$_applet
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/applets/$_applet/ \;
}
