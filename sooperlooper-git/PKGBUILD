# Maintainer: Denis Fokin <foks dot ua at gmail dot com>
# original pkgbuild by kasbah
pkgname=sooperlooper-git
_pkgname=sooperlooper
pkgver=20141219
pkgrel=1
pkgdesc="A live looping sampler capable of immediate loop recording, overdubbing, multiplying, reversing and more. Git development version."
arch=('i686' 'x86_64')
conflicts=('sooperlooper')
provides=('sooperlooper' 'slgui')
url="http://essej.net/sooperlooper/"
license=('GPL')
depends=('jack' 'liblo' 'wxgtk2.8' 'libsigc++' 'rubberband' 'libxml2')
install="$_pkgname.install"
source=( "$_pkgname.desktop"
        "slgui.png")
md5sums=('32fb17517f5f67931334f735eec826d9'
         '72e5581061403c022c1305e8b717e9d6')

_gitroot=https://github.com/essej/sooperlooper.git
_gitname=sooperlooper
_gitbranch=master

build() {
  cd "$srcdir/"
	msg "Connecting to GIT server ..."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin $_gitbranch
    msg "The local files are updated."
  else
    git clone --local --branch $_gitbranch "$_gitroot" "$_gitname"
		cd $_gitname
  fi
	
	./autogen.sh
  ./configure --prefix=/usr --with-wxconfig-path=/usr/bin/wx-config-2.8
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install

  # desktop file
  install -Dm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # icon
  install -Dm644 ../slgui.png \
    "$pkgdir/usr/share/pixmaps/slgui.png"
}
