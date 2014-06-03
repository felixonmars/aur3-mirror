# Maintainer: Gordin <gordin @t koeln.ccc.de>
pkgname=wit
pkgver=2.29a
_pkgrel=5186
pkgrel=1
pkgdesc="Wiimms ISO Tools is a set of command line tools to manipulate Wii ISO images and WBFS containers."
arch=('i686' 'x86_64')
url="http://wit.wiimm.de"
license=('GPL')
depends=('bash' 'fuse')
provides=('wwt')
conflicts=('wit-svn')
replaces=('wwt')
CARCH=x86_64
case "$CARCH" in
    i[3-6]86)
        _ARCH=i386
        sha256sums=('f7d26c415df0b2decf1e119ae3802374e126ba960994c910502613f152451c9d');;
    x86_64|amd64)
        _ARCH=x86_64
        sha256sums=('331b67dc68f5213796c37a037824e20529ed12cde2ed1e4e7104d9b8c6a31826');;
    # The following should not happen; provided you're using 'makepkg' ;)
    *) error "Unknown or invalid CARCH=$CARCH"; exit 1
esac

source=("http://wit.wiimm.de/download/wit-v${pkgver}-r${_pkgrel}-${_ARCH}.tar.gz")

build() {
  cd .
}

package () {
  _srcdir=${srcdir}/wit-v${pkgver}-r${_pkgrel}-${_ARCH}
  cd $_srcdir

  sed -i "s|/usr/local|${pkgdir}/usr|" install.sh
  sed -i "s|/usr/local|${pkgdir}/usr|" load-titles.sh
  # Load titles from http://www.wiitdb.com/
  sed -i "s|NEEDED=\"wit wget tr\"|NEEDED=\"wget tr\"|" load-titles.sh
  sed -i "s|wit titles|$_srcdir/bin/wit titles|" load-titles.sh

  ./install.sh --no-sudo

  cd $pkgdir/usr/share/wit
  sed -i "s|${pkgdir}||" load-titles.sh
  sed -i "s|${_srcdir}||" load-titles.sh

  cd $pkgdir/usr/bin
  chmod 755 wdf
  chmod 755 wdf-cat
}
