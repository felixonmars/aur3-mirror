# Contributor: Nick0602 <nick@linuxbox360.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: Fernando 'Zerial' Lagos B. <fernando@zerial.org>

pkgname=coccinella-bin
pkgver=0.96.20
pkgrel=1
pkgdesc="Jabber chat client with whiteboard communication"
url="http://www.coccinella.im"
license="GPL"
#depends=('libxss' 'libxft' 'gcc-libs')
arch=('i686' 'x86_64')
provides=('coccinella')
conflicts=('coccinella')
source=(http://prdownloads.sourceforge.net/coccinella/Coccinella-${pkgver}Linux-x86.tar.gz)
options=('!strip')
md5sums=('661b2f028e080e24eb7e9e8240362e3a')

build() {
  install -D -m755 $startdir/src/Coccinella-${pkgver}Linux-x86/Coccinella-$pkgver.bin \
                       $startdir/pkg/usr/bin/coccinella
}
