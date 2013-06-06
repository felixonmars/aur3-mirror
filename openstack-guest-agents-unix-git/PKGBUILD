# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=openstack-guest-agents-unix-git
pkgver=480.90ee948
pkgrel=1
pkgdesc="This is the Unix Guest Agent for Openstack"
arch=('i686' 'x86_64')
url="https://github.com/rackerlabs/openstack-guest-agents-unix"
license=('GPL')
depends=('python2-simplejson' 'python2-crypto' 'patchelf')
#checkdepends=('python2-pyxenstore')
makedepends=('git' 'python2-pyxenstore')
source=("$pkgname::git://github.com/gtmanfred/${pkgname%-git}")
md5sums=('SKIP')

pkgver(){
  echo $(git --git-dir=$srcdir/$pkgname/.git rev-list --count HEAD).$(git --git-dir=$srcdir/$pkgname/.git rev-parse --short HEAD)
}

prepare(){
  mkdir "$srcdir/$pkgname/m4"
  find "$srcdir/" -name \*.py -exec sed -i '1s/python$/&2/' {} +
}

build() {
  cd "$srcdir/$pkgname"
  sh autogen.sh
  ./configure CC=gcc --sbindir=/usr/bin
  make
}

#check(){
#  make -C "$srcdir/$pkgname" check || return 0
#}

package() {
  make -C "$srcdir/$pkgname" bintar
  tar -C "$pkgdir" -xf $srcdir/$pkgname/nova-agent-Linux-$CARCH-0.0.1.37.tar.gz
  install -Dm644 $pkgdir/usr/share/nova-agent/0.0.1.37/etc/systemd/system/nova-agent.service \
    $pkgdir/usr/lib/systemd/system/nova-agent.service
}

# vim:set ts=2 sw=2 et:
