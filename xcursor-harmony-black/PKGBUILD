# Contributor: grimi <grimi at poczta dot fm>

pkgname=xcursor-harmony-black
pkgver=1.5
pkgrel=2
pkgdesc="A black version of harmony cursor theme..."
arch=('any')
url="http://gnome-look.org/content/show.php/Harmony+black?content=145767"
license=('GPL')
depends=('libxcursor')
source=("http://gnome-look.org/CONTENT/content-files/145767-Harmony%20black.tar.gz")
md5sums=('162f659a2946dcd167a0065f03e5b6cc')


package() {
  ln -s "Harmony black" Harmony-black
  sed '2{s/ /-/;}' -i Harmony-black/index.theme
  find Harmony-black/ -type f -not -name "*~" \
    -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find Harmony-black/ -type l \
    -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}

# vim:set ts=2 sw=2 et:
