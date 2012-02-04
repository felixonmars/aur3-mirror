# Maintainer: Tomasz P. <tmszppATgmailDOTcom>
pkgname=xfwm4-clearlooks-colors-theme
pkgver=1.1
pkgrel=1
pkgdesc="Clearlooks Colors theme for XFWM4"
arch=(any)
url='http://xfce-look.org/content/show.php/Clearlooks-Xfce-Colors?content=90384'
license=('CC BY-ND 3.0')
groups=()
depends=(xfwm4)
makedepends=()
optdepends=('clearlooks-colors-gtk-theme: for matching GTK2 themes')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://xfce-look.org/CONTENT/content-files/90384-Clearlooks-Xfce-Colors.zip')
noextract=()
md5sums=('b1ec38dfd29e7a9f6dd0b5100fa9d24e')

build() {
  cd ${srcdir}
}

package() {
  cd ${pkgdir}
  install -d -m755 usr/share/themes
  cp -r ${srcdir}/Clearlooks-Xfce* usr/share/themes
  chmod -R 755 usr/share/themes/Clearlooks-Xfce*
  chmod 644 usr/share/themes/Clearlooks-Xfce-*/xfwm4/*
}