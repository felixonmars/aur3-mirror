# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=gloobus-preview-bzr
pkgver=290
pkgrel=1
pkgdesc="A quicklook for GNU/Linux"
arch=('i686' 'x86_64')
url="https://launchpad.net/gloobus-preview"
license=('GPL3')
depends=('desktop-file-utils' 'djvulibre' 'gstreamer0.10-base' \
         'gtksourceview3' 'libspectre' 'poppler-glib' \
         'python2-gconf' 'taglib')
makedepends=('boost' 'bzr' 'intltool')
optdepends=('gdk-pixbuf-psd: PSD images support'
            'gdk-pixbuf-xcf: XCF images support'
            'gloobus-sushi-bzr: nautilus 3.x support'
            'libicns: ICNS files support'
            'marlin-bzr: file manager integration support'
            'nautilus-actions: nautilus menu integration'
            'unoconv: LibO files support')
provides=('gloobus-preview')
conflicts=('gloobus-preview')
options=('!libtool')
install=$pkgname.install
source=('gloobus-preview::bzr+https://code.launchpad.net/~gloobus-dev/gloobus-preview/last_working_branch')
md5sums=('SKIP')

pkgver() {
  cd gloobus-preview
  bzr revno
}

prepare() {
  cd gloobus-preview

  # no psd and xcf loaders
  sed -i '/loaders/d' src/Makefile.am
  sed -i '/src\/loaders/d' configure.ac

  # automake 1.12.1 fix
  sed -i 's/-Werror//' configure.ac

  # python2 fix
  sed -i 's/python/&2/' src/gloobus-preview-configuration
}

build() {
  cd gloobus-preview
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd gloobus-preview
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
