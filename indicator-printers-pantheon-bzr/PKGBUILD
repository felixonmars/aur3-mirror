# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=indicator-printers-pantheon-bzr
pkgver=r0
pkgrel=2
pkgdesc="Indicator showing active print jobs"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-printers"
license=('GPL')
groups=('pantheon')
depends=('cups' 'libdbusmenu-glib' 'libdbusmenu-gtk3' 'libindicator3')
makedepends=('intltool' 'python2')
provides=('indicator-printers')
conflicts=('indicator-printers')
source=("bzr+lp:ubuntu/indicator-printers"
	'pantheon-session.patch')
sha512sums=('SKIP'
            '75cae4515668a6f191e3626e76337148e0ac796499a6846c4206781a6932a6e0dd7c730fb9bde9e86c6259255e5b9fc3d651ebfcd4902881bcf755974f60f21b')

pkgver() {
  cd indicator-pritnters

  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "${srcdir}/indicator-printers"

  patch -Np0 < ../pantheon-session.patch
}

build() {
  cd "${srcdir}/indicator-printers"

  autoreconf -vfi
  intltoolize -f
  ./configure --prefix=/usr --libexecdir=/usr/lib/indicator-printers-pantheon --disable-static
  make
}

package() {
  cd "${srcdir}/indicator-printers"

  make DESTDIR="${pkgdir}/" install

  rm -r "${pkgdir}/usr/share/upstart/"
}

