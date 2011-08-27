# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=kdecolorschemes
pkgver=20070927
pkgrel=1
pkgdesc="Top 10 highest-rated KDE color schemes"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/index.php?xcontentmode=28&xsortmode=high"
license=('GPL' 'LGPL' 'custom:Artistic 2.0')
source=(http://www.kde-look.org/CONTENT/content-files/36678-Black.kcsrc \
        http://www.kde-look.org/CONTENT/content-files/30795-puretechnology.kcsrc \
        http://www.kde-look.org/CONTENT/content-files/34888-windowmaker.kcsrc \
        http://www.kde-look.org/CONTENT/content-files/39745-Paper.tar.gz \
        57098-New_Kubuntu.tar.gz \
        http://www.kde-look.org/CONTENT/content-files/48004-DarkNights.kcsrc \
        30815-Black-White_n_Green_Beauty.tar.gz \
        http://www.kde-look.org/CONTENT/content-files/46345-openBC.kcsrc \
        http://www.kde-look.org/CONTENT/content-files/55551-Pink.kcsrc \
        http://www.kde-look.org/CONTENT/content-files/55993-FreeGreen.kcsrc \
        Artistic2.txt)
md5sums=('e65375f405ebcc3a91312cd62fb1b89a'
         '878d3db3d2a4ac777ba514db37db9080'
         '165eccd74e58c6fc737a2413ba834fad'
         '0aaefef69ea7996e1c6bf3ec3d6c4436'
         'c77fce36ce22f1a3d30aebc8aa391b61'
         'df6538e610f226562748a8b6a7d5afe4'
         '7ff52141d76fe2e7918457abaa80358b'
         'bc185fe7b5fb5aa10d0ba3df13d02ec9'
         'e75c818b813496113482402a2d98b930'
         '6cfac892e175206157ff8fc9868c7193'
         'f5ad524cea1c5a49aa3a98afc23b36c3')

build() {
  mkdir -p ${startdir}/pkg/opt/kde/share/apps/kdisplay/color-schemes
  find -iname "*.kcsrc" -exec install -m644 "{}" ${startdir}/pkg/opt/kde/share/apps/kdisplay/color-schemes/ ";"

  install -D -m644 Artistic2.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/Artistic2.txt
}

# vim:set ts=2 sw=2 et:
