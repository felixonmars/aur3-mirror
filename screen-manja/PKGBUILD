# Maintainer: Papajoker <papajoker [at] archlinux [dot] info>
pkgname=screen-manja
pkgver=0.1.0
pkgrel=1
pkgdesc="Fetches system/theme information in terminal for Linux Manjaro"
arch=('any')
url="https://github.com/papajoker/scren-manja"
license=('GPL')
groups=()
depends=('xorg-xdpyinfo' 'screenfetch>=3.6')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+http://github.com/papajoker/scren-manja#branch=master")
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

_gitroot=https://github.com/papajoker/scren-manja
_gitname=master

#pkgver() {
  #cd "$pkgname"
  #printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  cd "$srcdir/$pkgname"

  msg "Starting build..."
  echo "$srcdir/$pkgname"

  #
  # BUILD HERE
  #
  #./autogen.sh
  #./configure --prefix=/usr
  #make
}

package() {
  cd "$srcdir/$pkgname"
  echo "srcdir: ${srcdir}"
  echo "pkgdir: ${pkgdir}"
  
  install -Dm755 ./${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm744 ./etc/${pkgname}/items.conf ${pkgdir}/etc/${pkgname}/items.conf
  cp -r ./usr/ "${pkgdir}/usr/"

  #install -Dm744 ./usr/lib/${pkgname}/detect ${pkgdir}/usr/lib/${pkgname}/detect
  #install -Dm744 ./usr/lib/${pkgname}/plugins ${pkgdir}/usr/lib/${pkgname}/plugins
  
}

#makepkg -fsC --needed 
#sudo pacman -U screen-manja-0.1.0-1-any.pkg.tar.xz
