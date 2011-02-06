# Contributor: Jaroslaw Rosiek <jaroslaw.rosiek@interia.pl>
pkgname=kdecolors-ultraschemes
pkgver=3.2
pkgrel=1
arch=(i686)
license=(GPL)
pkgdesc="Pack of 220 KDE color schemes"
url="http://www.kde-look.org/content/show.php/Ultra+pack+-+220+color+schemes?content=72811"
depends=('kdebase')
source=(http://www.kde-look.org/CONTENT/content-files/72811-UltraSchemes-3.2.tar.gz)

build() {
  install -d "$startdir/pkg/opt/kde/share/apps/kdisplay/color-schemes/"
  install -m 644 "$startdir/src/UltraSchemes-3.2/"* "$startdir/pkg/opt/kde/share/apps/kdisplay/color-schemes/"
}

md5sums=('f5d4bac3e58b780ca1ae7ccf7403c2e1')
