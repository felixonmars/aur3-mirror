# Maintainer: Pierre Chapuis <catwell@archlinux.us>

pkgname=lua-markdown
pkgver=0.32
pkgrel=1
pkgdesc="Pure-lua implementation of the Markdown text-to-html markup system"
arch=('i686' 'x86_64')
url="http://luaforge.net/projects/markdown/" 
license=('MIT')
depends=('lua')
source=(markdown.lua::http://www.frykholm.se/files/markdown.lua LICENSE.txt)
md5sums=('0ea5f9d6d22a6c9aa4fdf63cf1d7d066'
         '660291b50920d12104c830a02fc02201')

build() {
  install -Dm0644 markdown.lua \
    $pkgdir/usr/share/lua/5.1/markdown.lua
  install -Dm0644 LICENSE.txt \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
