# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=font-5x13
pkgver=20110415
pkgrel=1
pkgdesc="a condensed pixel font built on 6x13 ('fixed')"
arch=(any)
url="https://github.com/chneukirchen/5x13"
license=('public domain')
depends=('xorg-mkfontdir' 'xorg-mkfontscale' 'fontconfig')
makedepends=('git' 'xorg-bdftopcf')
install=font-5x13.install
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/chneukirchen/5x13.git"
_gitname="5x13"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  bdftopcf 5x13.bdf |gzip >5x13.pcf.gz
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m644 5x13.pcf.gz $pkgdir/usr/share/fonts/misc/5x13.pcf.gz
} 
