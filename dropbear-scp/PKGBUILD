# $Id$
# Submitter: Maribu <mari (dot) hahn (at) wwu (dot) de>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jason Pierce <`echo 'moc tod liamg ta nosaj tod ecreip' | rev`>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>

_pkgname=dropbear
pkgname=$_pkgname-scp
pkgver=2015.67
pkgrel=1
pkgdesc="Lightweight replacement for sshd - missing scp tool"
arch=('i686' 'x86_64')
url="http://matt.ucc.asn.au/dropbear/dropbear.html"
license=('MIT')
depends=('zlib' 'dropbear')
conflicts=('openssh')
source=(http://matt.ucc.asn.au/$_pkgname/releases/$_pkgname-$pkgver.tar.bz2)
sha256sums=('7e690594645dfde5787065c78a5d2e4d15e288babfa06e140197ce05f698c8e5')
prepare() {
  sed -i 's|usr/libexec/sftp|usr/lib/ssh/sftp|' $_pkgname-$pkgver/options.h
}

build() {
  cd $_pkgname-$pkgver

  ./configure --prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin
  make scp
}

package() {
  cd $_pkgname-$pkgver

  install -D scp "${pkgdir}/usr/bin/scp"
}

