# Maintainer: Jordan Wade <jordan@jwade.net>

pkgname=lua-yaml
pkgver=0.2
pkgrel=2
pkgdesc="Lua bindings for YAML using the LibYAML library"
arch=('i686' 'x86_64')
url="http://yaml.luaforge.net/"
license=('MIT' 'custom')
depends=('lua' 'libyaml')
# URL doesn't change predictably with version number, so it's hardcoded
source=(http://luaforge.net/frs/download.php/4284/yaml-0.2.tar.gz
        Makefile.patch)
md5sums=('18c25a2a6609b2862e3485952cf73634'
         '59db514f6e03d751dfd4b8ced5534b78')

build() {
  cd $srcdir/yaml-$pkgver
  patch -p1 < ../Makefile.patch || return 1
  make || return 1
  make PREFIX=$pkgdir/usr install || return 1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 LICENSE.LibYAML $pkgdir/usr/share/licenses/$pkgname/LICENSE.LibYAML
}
