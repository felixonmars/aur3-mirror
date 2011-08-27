# Contributor: Travis Nickles <ryoohki7@yahoo.com>

pkgname=stepmania-cvs-extras
pkgver=1
pkgrel=6
pkgdesc="Extra stuff for StepMania 4.0 CVS"
url="http://stepmania.com/wiki/Downloads"
arch=(i686 x86_64)
depends=('stepmania-cvs')
makedepends=('unzip')
source=(http://www.stepmania.com/mirror.php?file=downloads/Songs_DJMcFox_PlagueMixOne.smzip \
http://www.stepmania.com/mirror.php?file=downloads/Songs_DJMcFox_PlagueMixThree.smzip \
http://www.stepmania.com/mirror.php?file=downloads/Songs_DJMcFox_PlagueMixTwo.smzip \
http://www.stepmania.com/mirror.php?file=downloads/Songs_DJMcFox_PlaguemixAntique.smzip \
http://www.stepmania.com/mirror.php?file=downloads/Songs_DancingWipEout_DomoDomoDomo.smzip \
http://www.stepmania.com/mirror.php?file=downloads/Songs_DarkChao_TheErrorSong.smzip \
http://www.stepmania.com/mirror.php?file=downloads/Songs_Frieza_Sweet.smzip \
http://www.stepmania.com/mirror.php?file=downloads/Songs_GroupBanners_Dance.smzip \
http://www.stepmania.com/mirror.php?file=downloads/Songs_GroupBanners_Pump.smzip \
http://www.stepmania.com/mirror.php?file=downloads/Songs_Nathan_MrRoboto.smzip \
http://www.stepmania.com/mirror.php?file=downloads/Songs_StepMix1_DMAshura_DiSCONNECTED_HaZaRD.smzip \
http://www.stepmania.com/mirror.php?file=downloads/Songs_StepMix1_DMAshura_MAX_Forever.smzip \
http://www.stepmania.com/mirror.php?file=downloads/Songs_StepMix1_DMAshura_MaxX_AttaxX.smzip \
http://www.stepmania.com/mirror.php?file=downloads/Songs_StepMix1_DMAshura_neoMAX.smzip \
http://www.stepmania.com/mirror.php?file=downloads/Songs_StepMix1_DMAshura_omega.smzip)
md5sums=('192808ad8eb76cfa91d78c4176f1c29d' '7fa1d139cf09c03a962360d083febbb3'\
         '9be71ee392a88093349e3a2f1398db95' '22aebdb8d70cb1215ac74a117880ac99'\
         'dbf8146d7d20b0d2d8c1d84c3f07e35e' '02980c8e4ca943208e6f704059fc1df9'\
         '049e083af64fd66a20540fb2f71f7912' '57ad64017e10fcad2f69b9b211ce5a35'\
         'a4fbce1f0d7908ae3882de0fd3c7f04d' 'a026e7134508c10ddf591adbaad66dac'\
         'bd47219db353e9dca9569ff93f1c0632' 'a9dad2f5eba2afc35d4ccdc97b0575e0'\
         'e50161da44cd7d50a811c922bb021976' '5e2e183c2c604c742e39b6b5ff254501'\
         'e237888d3f8afaab943fefab74fc0edf')

build() {
  cd $startdir/src

  # Unzip all archives and extract the contents to the stepmania-cvs folder
  for file in `ls *.smzip`; do
    unzip -o $file -d stepmania-cvs
  done

  # Rename the folder that would cause problems with pacman and
  # delete an unnecessary file
  mv stepmania-cvs/Songs/Plaguemix\ Series/Bitches\ \(*-ZIQ\ Remix\) stepmania-cvs/Songs/Plaguemix\ Series/Bitches\ \(u-ZIQ\ Remix\)
  rm stepmania-cvs/smzip.ctl

  # Copy all content
  install -d $startdir/pkg/opt
  cp -r stepmania-cvs $startdir/pkg/opt
}
