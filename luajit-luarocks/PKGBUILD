# Maintainer: Lulker <lulker@chome.ws>
pkgname=luajit-luarocks
pkgver=2.0.13
pkgrel=1
pkgdesc='Deployment and management system for Lua modules. Configured for luajit, compatible with luajit-dev-git.'
arch=('any')
url='http://luarocks.org/'
depends=('luajit' 'unzip' 'zip' 'curl')
optdepends=('cvs: for fetching sources from CVS repositories'
            'git: for fetching sources from git repositories'
            'mercurial: for fetching sources from mercurial repositories'
            'lua51-sec: HTTPS support'
            'cmake: for building rocks that use the cmake build system')
license=('custom')
provides=('luarocks')
conflicts=('luarocks')
source=(http://luarocks.org/releases/luarocks-$pkgver.tar.gz)
md5sums=('b46809e44648875e8234c2fef79783f9')

build() {
  cd luarocks-$pkgver
  _LUAJITINC=`echo /usr/include/luajit-*`
  ./configure --lua-suffix=jit \
              --prefix=/usr \
              --sysconfdir=/etc/luarocks \
              --with-lua-include=$_LUAJITINC \
              --with-downloader=curl \
	      --with-lua=/usr
  make 
}

package() {
  cd luarocks-$pkgver
  make install DESTDIR="$pkgdir"
  install -D COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}