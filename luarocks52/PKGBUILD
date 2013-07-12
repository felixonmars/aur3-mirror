# Maintainer: Curt Strangward <acelightstudios at gmail dot com>
# Contributor:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>

pkgname=luarocks52
pkgver=2.0.13
pkgrel=1
pkgdesc='Deployment and management system for Lua modules, built for Lua 5.2.'
arch=('any')
url='http://luarocks.org/'
depends=('lua' 'unzip' 'zip' 'curl')
optdepends=('cvs: for fetching sources from CVS repositories'
            'git: for fetching sources from git repositories'
            'mercurial: for fetching sources from mercurial repositories'
            'lua51-sec: HTTPS support'
            'cmake: for building rocks that use the cmake build system')
license=('custom')

options=('!makeflags')
source=(http://luarocks.org/releases/luarocks-$pkgver.tar.gz)
md5sums=('b46809e44648875e8234c2fef79783f9')

build() {
  cd luarocks-$pkgver

  ./configure --prefix=/usr \
              --sysconfdir=/etc/luarocks \
              --lua-version=5.2 \
              --with-lua-include=/usr/include \
              --with-downloader=curl \
              --with-lua=/usr
  make
}

package() {
  cd luarocks-$pkgver
  make install DESTDIR="$pkgdir"
  rm -f "$pkgdir/usr/bin/luarocks"
  rm -f "$pkgdir/usr/bin/luarocks-admin"
  install -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
