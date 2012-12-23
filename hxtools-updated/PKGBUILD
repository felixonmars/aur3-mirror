# Maintainer: walterjwhite <WalterWhite(AT)walterjwhite.com>
pkgname=hxtools-updated
pkgver=20121125
pkgrel=1
pkgdesc="A collection of tools and scripts that have accumulated over the years, and each of which seems to be too small to warrants its own project."
arch=('i686' 'x86_64')
url="http://jftp.inai.de/hxtools/"
license=('GPL3')
depends=('libhx>=3.12.1' 'util-linux>=2.20' 'pciutils>=3' 'libxcb>=1' 'perl')
makedepends=('sed')
source=http://jftp.inai.de/hxtools/hxtools-$pkgver.tar.xz
md5sums=('a68d58b673462407ec63d84c550d6b22')

build() {
	# @TODO: rename package, replace old package
  #cd $srcdir/$pkgname-$pkgver
  cd $srcdir/hxtools-$pkgver
  
  ./configure --libexecdir=/usr/lib --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
