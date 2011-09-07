# Maintainer: Corrado Primier (bardo) <ilbardo gmail com>
# Contributor: jordi Cerdan (jcerdan) <jcerdan@tecob.com>

pkgname=gpomme
pkgver=1.39
pkgrel=1
pkgdesc="GTK+ client for pommed"
arch=('i686' 'x86_64')
url="http://technologeek.org/projects/pommed/"
license=('GPL2')
depends=('dbus-glib' 'gtk2' 'pommed')
source=(http://alioth.debian.org/frs/download.php/3583/pommed-${pkgver}.tar.gz)
md5sums=('f36757d180ed4f35fced6c096e1bcbeb')

build() {
  cd ${srcdir}/pommed-${pkgver}
  make gpomme || return 1
}

package() {
  # Binaries
  install -Dm755 ${srcdir}/pommed-${pkgver}/gpomme/gpomme ${pkgdir}/usr/bin/gpomme
  install -Dm644 ${srcdir}/pommed-${pkgver}/gpomme/gpomme.desktop ${pkgdir}/usr/share/applications/gpomme.desktop

  # Themes
  #install -D -m644 ${srcdir}/pommed-${pkgver}/gpomme/gpomme.glade ${pkgdir}/usr/share/gpomme/gpomme.glade
  cd ${srcdir}/pommed-${pkgver}/gpomme/themes/
  for i in * ; do
    if [[ -d $i ]] ; then
      install -dm755 ${i} ${pkgdir}/usr/share/gpomme/themes/${i}
      install -Dm644 ${i}/*.png ${pkgdir}/usr/share/gpomme/themes/${i}/
    fi
  done

  # Icons
  install -Dm644 ${srcdir}/pommed-${pkgver}/icons/gpomme.svg ${pkgdir}/usr/share/pixmaps/gpomme.svg
  install -Dm644 ${srcdir}/pommed-${pkgver}/icons/gpomme_48x48.png ${pkgdir}/usr/share/pixmaps/gpomme.png

  # Man page
  install -Dm644 ${srcdir}/pommed-${pkgver}/gpomme/gpomme.1 ${pkgdir}/usr/share/man/man1/gpomme.1
}

# vim:set ts=2 sw=2 et:
