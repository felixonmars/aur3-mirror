# Maintainer: Christoph Wiedemann <chwiede@gmail.com>
pkgname=htpcutils
pkgver=20130322
pkgrel=1
pkgdesc="Powermanager and tools for a HTPC based on XBMC and TvHeadend"
arch=('i686' 'x86_64')
url="https://github.com/chwiede/htpc"
license=('GPL')
groups=()
depends=('xorg-server' 'openbox' 'acpid')
makedepends=()
optdepends=('ntp')
provides=()
conflicts=()
replaces=()
backup=('etc/htpcutils/htpc.conf')
options=()
install=htpcutils.install
changelog=


_gitroot="git://github.com/chwiede/htpc.git"
_gitname="htpcutils-git"


build() {

  ### go into sources
  cd "$srcdir"
  msg "Connecting to GIT server..."
  
  ### get sources
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname"
    git pull origin
    msg "GIT update done!"
  else
    git clone "$_gitroot" "$_gitname"
    msg "GIT clone done!"
  fi
  
  ### install files
  source="$srcdir/htpcutils-git/htpcutils"
  
  mkdir -p "$pkgdir/etc/htpcutils"
  mkdir -p "$pkgdir/lib/systemd/system"
  mkdir -p "$pkgdir/usr/lib/htpcutils"
  
  cp "$source/config/htpc.conf" "$pkgdir/etc/htpcutils/"
  cp "$source/config/htpcutils.service" "$pkgdir/lib/systemd/system/"
  
  cd "$source/controller"
  cp -R * "$pkgdir/usr/lib/htpcutils/"
  chmod -R +x "$pkgdir/usr/lib/htpcutils/"
    
}


#package() {
#  cd "$srcdir/$pkgname-$pkgver"
#
#  make DESTDIR="$pkgdir/" install
#}
