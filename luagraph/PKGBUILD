# Maintainer: Philipp Gesang <megas dot kapaneus at gmail dot com>
pkgname=luagraph
pkgver=1.0.4
pkgrel=1
pkgdesc="A binary module to create, manipulate, layout and render graphs using the Lua programming language."
arch=("any")
url="http://luaforge.net/projects/${pkgname}"
license=("MIT")
depends=("lua" "graphviz")
source=("http://luaforge.net/frs/download.php/4528/${pkgname}-${pkgver}.tar.gz")
md5sums=("f2f71bcbabf243792e230665b1403f58")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
  install -Dm0755 graph/core.so "${pkgdir}/usr/lib/lua/5.1/graph/core.so"
  install -Dm0644 graph.lua "${pkgdir}/usr/lib/lua/5.1/graph.lua"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
