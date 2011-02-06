# Contributor: h31 <h31mail (at) yandex.com>
pkgname=qutim-plugin-nowlistening
pkgver=18
pkgrel=1
pkgdesc="NowListening plugin for Qutim"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
makedepends=('gcc' 'make' 'cmake')
depends=('qutim-svn' 'libmpd' 'qutim-protocol-jabber-svn')
source=("http://dl.getdropbox.com/u/1830526/Packages/NowListening_upd${pkgver}.zip")
md5sums=('eee900de2fda49ac763f4bfee48f788a')

build() {
msg "Building and installing..."
   cd $srcdir/NowListening
   cmake . -DCMAKE_INSTALL_PREFIX=/usr -DUNIX=1 -DWIN32=0 -DAPPLE=0 || return 1
   make || return 1
   install -Dm 644 $srcdir/NowListening/libNowListening.so \
                   $pkgdir/usr/lib/qutim/libNowListening.so || return 1 
}