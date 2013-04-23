# Contributor: Wu Siyun <woosiyun@gmail.com>
pkgname=dnsmasq-utils
pkgver=2.6
pkgrel=0
pkgdesc="dhcp_release binary and sbin link for dnsmasq"
arch=('x86_64' 'i686')
url="http://www.thekelleys.org.uk/dnsmasq/" 
license=('GPL') 
groups=()
depends=('dnsmasq')
makedepends=()
provides=()
replaces=()
options=()
install=
makedepends=('git')
_gitroot="git://thekelleys.org.uk/dnsmasq.git"
_gitname="dnsmasq"

build() {
  cd "$srcdir"
  msg "Connectiong to GIT Server..."
  if [[ -d "$_gitname.git" ]];then
     cd "$_gitname.git" && git pull origin
     msg "The local files are updated"
  else
    git clone "$_gitroot" "$_gitname.git"
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf $srcdir/src
  mkdir -p $srcdir/src
  git clone $srcdir/$_gitname.git $srcdir/src/$_gitname
  cd $srcdir/src/$_gitname/contrib/wrt
  make
}

package() {
  cd $srcdir/src/$_gitname/contrib/wrt
  install -Dm 755 $srcdir/src/$_gitname/contrib/wrt/dhcp_release $pkgdir/usr/bin/dhcp_release
  mkdir -p $pkgdir/usr/sbin/
  ln -s /usr/bin/dnsmasq $pkgdir/usr/sbin/dnsmasq
}

# vim:set ts=2 sw=2 et:
