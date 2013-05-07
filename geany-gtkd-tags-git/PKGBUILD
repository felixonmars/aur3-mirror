#Maintainer: TingPing <tingping@tingping.se>
pkgname=geany-gtkd-tags-git
pkgver=2.1.0.42.g4c3922d
pkgrel=1
pkgdesc='Geany tags for GtkD'
url='http://dsource.org/projects/gtkd'
license=('LGPL')
arch=('any')
makedepends=('git')
depends=('geany')
source=('git://github.com/gtkd-developers/GtkD.git')
md5sums=('SKIP')
_gitname='GtkD'

pkgver() {
	cd "$_gitname"
	_ver=`git describe --always | sed 's/-/./g'`
	echo ${_ver:5}
}

build() {
	cd "$_gitname"
	geany -c geany_config -g gtkd.d.tags $(find src* -name "*.d")
}

package() {
	cd "$_gitname"
	install -m0644 -D "gtkd.d.tags" "$pkgdir/usr/share/geany/tags/gtkd.d.tags"
}

