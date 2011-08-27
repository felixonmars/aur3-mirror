# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=lcms-git
pkgver=20100607
pkgrel=1 
pkgdesc="small-footprint color management lib/engine - git version"
url="http://www.littlecms.com"
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=('libtiff')
makedepends=('git')
conflicts=('lcms')
provides=('lcms=2.0a')
source=()
md5sums=()
options=('libtool')

_gitroot="http://github.com/mm2/Little-CMS.git"
_gitname=lcms

build() {  
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."

  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  install -Dm 644 COPYING \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  rm -r $srcdir/$_gitname-build
}
