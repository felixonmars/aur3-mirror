# Contributer: Benjamin Andresen <benny@klapmuetz.org>
pkgname=ruby-svggraph
_realname=svg_graph
pkgver=0.6.1
pkgrel=1
pkgdesc="SVG:::Graph is a pure Ruby library for generating charts."
url="http://www.germane-software.com/software/SVG/SVG::Graph/"
depends=('ruby')
source=(http://www.germane-software.com/archives/${_realname}_${pkgver}.tgz)
md5sums=('e78e1c7fdde0aaa17d216cb6ba0b8d01')

build() {
	cd $startdir/src/${_realname}_$pkgver
  ruby install.rb --destdir $startdir/pkg/
}
# vim: ft=sh ts=2 et
