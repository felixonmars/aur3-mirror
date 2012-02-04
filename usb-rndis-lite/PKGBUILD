# Contributor: Alexey "Mr.Cat" Bakhirkin <abakhirkin@gmail.com>
pkgname=usb-rndis-lite
pkgver=0.11
pkgrel=1
pkgdesc='USB RNDIS driver for SynCE (supersedes the one from kernel26)'
arch=('i686' 'x86_64') #Did not test for i686 but it should work
url='http://www.synce.org'
license=('unknown') #Other SynCE components are distrubuted under either GPL or MIT license, but no particular license is specified for usb-rndis-lite
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname.install" #Just executes 'depmod -ae' in post-actions
source=(http://synce.svn.sourceforge.net/viewvc/synce/releases/$pkgver/$pkgname.tar.gz)
noextract=()
md5sums=('d3923d667ccfc4ad392356f1e5b457c4')

build() {
  cd "$srcdir/$pkgname"
  
  make || return 1
  mkdir -p "$pkgdir/lib/modules/$(uname -r)/updates"
  cp "$srcdir/$pkgname/"*.ko "$pkgdir/lib/modules/$(uname -r)/updates"
}

# vim:set ts=2 sw=2 et:
