# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=mbrola-italian
pkgver=301
pkgrel=1
pkgdesc="Italian MBROLA voices for Festival"
url="http://www.pd.istc.cnr.it/FESTIVAL/home/default.htm"
license=""
depends=('festival' 'mbrola' 'festival-italian')
makedepends=('unzip')
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/it3/it3-010304.zip"\
        "http://tcts.fpms.ac.be/synthesis/mbrola/dba/it4/it4-010926.zip"
        "http://www.pd.istc.cnr.it/Software/It-Festival/lp_mbrola_unix.zip"\
        "http://www.pd.istc.cnr.it/Software/It-Festival/pc_mbrola_unix.zip")
md5sums=('fed63cdf4da274966646bdac1bd6e630' 'd70ddbda1085990290e98bf745db1536'\
         '2c2d293193f0bf3b984af1aa39519cff' 'c4c721f16ce8dbca89d847412ade0bc2')

build() {
  cd $startdir/src/
  mv it3 festival/lib/voices/italian/lp_mbrola/
  mv it4 festival/lib/voices/italian/pc_mbrola/
  mkdir $startdir/pkg/usr/share/festival -p
  mv festival/lib/* $startdir/pkg/usr/share/festival 
}
