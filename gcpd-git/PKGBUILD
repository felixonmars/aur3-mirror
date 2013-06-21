# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
pkgname=gcpd-git
pkgver=20130616
pkgrel=1
pkgdesc="A server implementing the GCP (Generic Chat Protocol) specifications."
arch=('i686' 'x86_64')
url="https://github.com/samrg472/GcpD"
license=('Apach')
depends=('mono')
makedepends=('git' 'mono')
source=('gcpd.sh')
sha1sums=('bf35e52f7912a4112cee2c85879030eb0147c65a')
_gitroot=git://github.com/samrg472/GcpD.git
_gitname=GcpD

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin && git submodule update
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" && cd $_gitname && git submodule init && git submodule update
  fi
  msg "Starting Build"

  cd "$srcdir/$_gitname"

  #
  # BUILD HERE
  #
  xbuild /target:Server
}

package() {
 cd "$srcdir/$_gitname/bin/Debug"
 mkdir $pkgdir/opt/GcpD/ -p
 install -D Server.exe $pkgdir/opt/GcpD/
 install -D JsonFx.dll $pkgdir/opt/GcpD/
 install -D JsonConfig.dll $pkgdir/opt/GcpD/
 install -D $srcdir/gcpd.sh $pkgdir/usr/bin/gcpd
}
