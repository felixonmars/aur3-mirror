# Maintainer: Ignas Anikevičius

_pkgname=ldoc
pkgname=${_pkgname}-git
pkgver=1.4.2.4.g6d29aef
pkgrel=1
pkgdesc='A LuaDoc-compatible documentation generation system'
arch=('any')
url='http://stevedonovan.github.com/ldoc/'
license=('custom')
depends=('lua' 'lua-penlight')
provides=('ldoc')
conflicts=('ldoc')
source=(${_pkgname}::git+https://github.com/stevedonovan/LDoc.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $_pkgname
  # install library
  install -dm755 "$pkgdir/usr/share/lua/5.2"
  cp -a ldoc "$pkgdir/usr/share/lua/5.2"
  # install binaries
  install -Dm755 ldoc.lua "$pkgdir/usr/bin/ldoc.lua"
  ln -s ldoc.lua "$pkgdir/usr/bin/ldoc"
  # copy docs
  install -Dm644 readme.md "$pkgdir/usr/share/doc/$_pkgname/readme.md"
  install -Dm644 doc/doc.md "$pkgdir/usr/share/doc/$_pkgname/doc.md"
  # copy license
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
