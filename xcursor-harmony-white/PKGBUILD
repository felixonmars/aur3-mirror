# Contributor: grimi <grimi at poczta dot fm>

pkgname=xcursor-harmony-white
pkgver=1.5
pkgrel=2
pkgdesc="A white version of harmony cursor theme..."
arch=('any')
url="http://gnome-look.org/content/show.php/Harmony+white?content=145766"
license=('GPL')
depends=('libxcursor')
source=("http://gnome-look.org/CONTENT/content-files/145766-Harmony%20white.tar.gz")
md5sums=('8385c554703282eadedbff6cf28956f7')


package() {
  ln -s "Harmony white" Harmony-white
  sed '2{s/ /-/;}' -i Harmony-white/index.theme
  find Harmony-white/ -type f -not -name "*~" \
    -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find Harmony-white/ -type l \
    -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}

# vim:set ts=2 sw=2 et:
