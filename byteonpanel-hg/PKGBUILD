# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=byteonpanel-hg
pkgver=34.bb183c290a8f
pkgrel=1
pkgdesc="Network data monitor applet for LXDE, also compatible with most window managers."
arch=('i686' 'x86_64')
url="https://bitbucket.org/mozbugbox/byteonpanel/wiki/Home"
depends=('gtk3')
makedepends=('vala' 'gnome-common' 'mercurial' 'intltool')
license=('GPL3')
source=("hg+https://bitbucket.org/mozbugbox/byteonpanel")
md5sums=('SKIP')
pkgver() {
  cd byteonpanel
  echo $(hg identify -n).$(hg identify -i)
}

build() {
 cd byteonpanel
 sh autogen.sh
 make
}

package() {
  cd byteonpanel
  install -Dm 755 src/byteonpanel ${pkgdir}/usr/bin/byteonpanel
  install -Dm 644 byteonpanel.desktop ${pkgdir}/usr/share/applications/byteonpanel.desktop
}	
