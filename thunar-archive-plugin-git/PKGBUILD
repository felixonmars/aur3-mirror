# Mantainer: Diego <cdprincipe@at@gmail@dot@com>
# Contributor: Baurzhan Muftakhidinov <baurthefirst@gmail.com>

_pkgname=thunar-archive-plugin
pkgname=${_pkgname}-git
pkgver=0.3.1.4.g199ed93
pkgrel=1
pkgdesc="create and deflate archives in thunar"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org"
groups=('xfce4-git')
#depends=('thunar-git' 'hicolor-icon-theme')
depends=('thunar' 'hicolor-icon-theme')
#makedepends=('git' 'intltool' 'xfce4-dev-tools-git')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!libtool')
install=$pkgname.install
source=("git://git.xfce.org/thunar-plugins/$_pkgname")
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g' -e 's|thunar.archive.plugin.||'
}

build() {
  cd $srcdir/$_pkgname
    
  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static
    
  make
}

package() {
  cd $srcdir/$_pkgname
  make DESTDIR=$pkgdir install
}
