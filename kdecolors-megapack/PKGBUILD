# Contributor: Wes Brewer <brewerw@gmail.com>
pkgname=kdecolors-megapack
pkgver=0.2
pkgrel=1
pkgdesc="265 KDE color schemes from kde-look.org"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Mega+Pack+Color+Schemes?content=25974"
license=('GPL')
source=(http://www.kde-look.org/CONTENT/content-files/25974-megapackcolorschemes-$pkgver.tar.gz)
md5sums=('c3a6ea13b5bff74ea01112b7ccbaed3c')

build() {
  cd "$startdir/src/megapackcolorschemes-$pkgver"

  # Remove 28 duplicate/conflicting color schemes (already in KDEbase)
  rm -f AtlasGreen.kcsrc BeOS.kcsrc BlackOnWhite.kcsrc BlueSlate.kcsrc CDE.kcsrc \
   DarkBlue.kcsrc DesertRed.kcsrc DigitalCDE.kcsrc EveX.kcsrc KDEOne.kcsrc KDETwo.kcsrc \
   Keramik.kcsrc KeramikEmerald.kcsrc KeramikWhite.kcsrc MediaPeach.kcsrc Next.kcsrc \
   PaleGray.kcsrc Plastik.kcsrc PointReyesGreen.kcsrc Pumpkin.kcsrc SolarisCDE.kcsrc \
   Storm.kcsrc System.kcsrc WhiteOnBlack.kcsrc Windows2000.kcsrc Windows95.kcsrc \
   WindowsXP.kcsrc YellowOnBlue.kcsrc

  # Install color schemes
  install -d $startdir/pkg/opt/kde/share/apps/kdisplay/color-schemes/
  install -m644 * $startdir/pkg/opt/kde/share/apps/kdisplay/color-schemes/
}

# vim:set ts=2 sw=2 et:
