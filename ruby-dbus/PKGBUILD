# Contributor: Moritz Heidkamp <moritz.heidkamp@bevuta.com>
# Contributor: Jens Maucher <defcon@archlinux.us>
pkgname=ruby-dbus
pkgver=0.3.1
pkgrel=1
pkgdesc="A Ruby implementation of D-Bus"
arch=('i686' 'x86_64')
url="https://trac.luon.net/ruby-dbus/"
license=('LGPL')
makedepends=(ruby)
source=(http://cloud.github.com/downloads/mvidner/ruby-dbus/$pkgname-$pkgver.tgz)
md5sums=('2a223dc2fa226d4644bb749771215575')
 
build() {
  cd "$startdir/src/$pkgname-$pkgver"
  ruby setup.rb config --prefix=${startdir}/pkg
  ruby setup.rb setup
  ruby setup.rb install --prefix=${startdir}/pkg
}
 
# vim:set ts=2 sw=2 et: