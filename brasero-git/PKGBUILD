# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>
# Contributor: Mauro Fruet <maurofruet@gmail.com>
# Contributor: Hussam Al-Tayeb <ht990332@gmail.com>

pkgname=brasero-git
pkgver=3.12.0.r8.gce187bb
pkgrel=1
pkgdesc="A disc burning application for Gnome"
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/brasero/"
license=('GPL')
options=('!emptydirs')
depends=('gtk3' 'gst-plugins-good' 'totem-plparser' 'cdrkit' 'cdrdao' 'desktop-file-utils' 'hicolor-icon-theme' 'shared-mime-info'  'libcanberra' 'dvd+rw-tools' 'dconf' 'libsm' 'libtracker-sparql' 'libnotify' 'gvfs')
makedepends=('gtk-doc' 'yelp-tools' 'gnome-common' 'intltool' 'libburn' 'libisofs' 'libnautilus-extension' 'gobject-introspection' 'gconf' 'itstool' 'docbook-xsl')
optdepends=('libburn: alternative back-end'
            'libisofs: libburn back-end'
            'dvdauthor: video project'
            'vcdimager: video project')
replaces=('nautilus-cd-burner')
install=brasero.install
groups=('gnome-extra')
conflicts=('brasero')
provides=('brasero')
install=brasero.install
source=("$pkgname"::'git+https://git.gnome.org/browse/brasero'
        'brasero.install')
md5sums=('SKIP'
         '6a9c4364c5a1a3c5d2012df3c976857a')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-caches \
      --disable-schemas-compile
  make
}

package() {
    cd "$pkgname"
    make DESTDIR=$pkgdir install
}
