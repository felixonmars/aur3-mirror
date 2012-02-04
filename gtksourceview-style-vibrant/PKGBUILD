# Maintainer: Maskawanian <aur@cryingwolf.org>
pkgname=gtksourceview-style-vibrant
pkgver=2009.10.12
pkgrel=1
pkgdesc="A Modification of the brown colour scheme."
arch=(any)
depends=('gtksourceview')
license=('custom:unknown')
source=(http://scribes.sf.net/vibrant.tar.bz2)
url=('http://mystilleef.blogspot.com/2009/10/vibrant-new-theme-for-gtksourceview-2.html')
md5sums=('628553ff9736483f762f756bce3a45d9')

build() {
cd ${startdir}/pkg || return 1
mkdir -p usr/share/gtksourceview-2.0/styles || return 1
cd usr/share/gtksourceview-2.0/styles || return 1
cp -r ${srcdir}/vibrant/vibrant.xml .
chmod 755 vibrant.xml
}
