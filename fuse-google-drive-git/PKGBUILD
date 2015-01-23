# Maintainer: maz-1 <loveayawaka at gmail dot com>
pkgname=fuse-google-drive-git
_pkgname=gdrive
pkgver=20150122
pkgrel=1
pkgdesc="google drive cli fuse client" 
arch=("x86_64" "i686")
url="https://github.com/jcline/fuse-google-drive"
license=('GPL')
depends=('libxml2' 'json-c' 'fuse' 'curl')
makedepends=('git')
source=("git+https://github.com/jcline/fuse-google-drive.git")
md5sums=('SKIP')

_gitname=('fuse-google-drive')

build() {


  cd "$srcdir/$_gitname"
  #sed -i 's:\(gdi_load_clientid(\)"clientid":\1strcat(getenv("XDG_CONFIG_HOME"), "/fuse-google-drive/clientid"):' gd_interface.c
  #sed -i 's:\(gdi_load_clientsecrets(\)"clientsecrets":\1strcat(getenv("XDG_CONFIG_HOME"), "/fuse-google-drive/clientsecrets"):' gd_interface.c
  #sed -i 's:\(gdi_load_redirecturi(\)"redirecturi":\1strcat(getenv("XDG_CONFIG_HOME"), "/fuse-google-drive/redirecturi"):' gd_interface.c
  sed -i 's/json])/json-c])/' configure.ac
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 filetype=PKGBUILD
