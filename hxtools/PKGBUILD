# Contributor: Evilandi666 <evilandi.aur(at)googlemail.com>
# Maintainer: Marcel Huber <marcelhuberfooatgmaildotcom>
pkgname=hxtools
pkgver=20140325
pkgrel=1
pkgdesc="A collection of tools and scripts that have accumulated over the years, and each of which seems to be too small to warrants its own project."
arch=('i686' 'x86_64')
url=http://inai.de/projects/hxtools/
license=('GPL3')
depends=('libhx>=3.15' perl util-linux pciutils libxcb)
makedepends=()
source=(http://jftp.inai.de/hxtools/hxtools-$pkgver.tar.xz)
sha256sums=('a66a197a437c23e78cddffcfaf07e6bada56736b6ba1766c3b4333e29ba2a589')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --libexecdir=/usr/lib --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
