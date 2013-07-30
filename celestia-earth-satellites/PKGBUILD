# Maintainer: 
# Contributor: ConnorBehan <connor.behan@gmail.com>

pkgname=celestia-earth-satellites
pkgver=1.0
pkgrel=2
pkgdesc="Human-made satellites orbiting the Earth"
arch=('any')
url="http://celestiamotherlode.net/catalog/satellites.php"
license=('GPL')
depends=('celestia>=1.3.2')
makedepends=('unzip')
source=(http://celestiamotherlode.net/creators/j_lafleur/AO7.zip http://celestiamotherlode.net/creators/jestr/BigHubbleCMOD_V3.zip \
	http://celestiamotherlode.net/creators/jackhiggins/chandra.zip http://celestiamotherlode.net/creators/jackhiggins/chandramodel.zip \
	http://www.celestiamotherlode.net/creators/carlytos/Corot.zip http://www.celestiamotherlode.net/creators/dirl/DIRL_globalstar.zip \
	http://celestiamotherlode.net/creators/guilpan/Eccentrics.zip http://celestiamotherlode.net/creators/guilpan/Geostationary_full.zip \
	http://www.celestiamotherlode.net/creators/guilpan/Globalstar.zip http://www.celestiamotherlode.net/creators/jeffyen/gps.zip \
	http://www.celestiamotherlode.net/creators/adirondack/hst-ssc_060208.zip http://www.celestiamotherlode.net/creators/guilpan/Iridium.zip \
	http://www.celestiamotherlode.net/creators/guilpan/iridium_26_07_2006.zip http://celestiamotherlode.net/creators/jackhiggins/iso.zip \
	http://celestiamotherlode.net/creators/jackhiggins/isomodel.zip http://www.celestiamotherlode.net/creators/adirondack/iss-ssc_060716.zip \
	http://www.celestiamotherlode.net/creators/orion_nebula/isscomplete.zip http://www.celestiamotherlode.net/creators/orion_nebula/isstextures.zip \
	http://celestiamotherlode.net/creators/jackhiggins/spitzer.zip http://celestiamotherlode.net/creators/jackhiggins/spitzermodel.zip \
	http://www.celestiamotherlode.net/creators/terrier/TERRIERS_cmod.zip)

md5sums=('d050a6981687ea6c53192e83b6a9bf71'
         '70978b99cb929b5472d8b9ea7f2faedc'
         '9a8af156400361dc3c9693fc964a6744'
         '59290217f4cf6595134e5ea0f62286f7'
         '7d373494f2ec63cd60a79c031e2f1f4b'
         '3afe4ebffdcca41c4f68a0de39be9895'
         '2094e9ab72fe0c3d850c71fabafff9e7'
         '82e8746358f4e85f202649492106b795'
         'd483dd01f034d19a389266edbc3ec734'
         '468c5dfb5228723180ce198448117bb7'
         '758299f2d9e2d9f538e9871a0c744258'
         'c936370b955c130bafee476558e074f3'
         '3b7ddadcbc919ae7cbb7e28ed518d6cc'
         '20498bf9e5666f123908bf582006faf7'
         'e3deb239ba2391b4fe042960ffbdce9f'
         '9cc54af7dfa6db862db37ab751ef6eff'
         '2ea57b66709eae748f8a6f96ffcf0854'
         '8c29bee1e981f08d9003947fbc7dd91a'
         '127b14520d848bf1ef322e0864e8c50c'
         'c8930d2e2b500e0a92c209c256abc97e'
         '2e623f0eb98bc4c2195e9bb7ebf29e1f')

package() {

# TODO: use install instead of mkdir and cp

  mkdir "$pkgdir"/usr/
  mkdir "$pkgdir"/usr/share
  mkdir "$pkgdir"/usr/share/celestia
  mkdir "$pkgdir"/usr/share/celestia/extras
  mkdir "$pkgdir"/usr/share/celestia/textures
  mkdir "$pkgdir"/usr/share/celestia/models
  mkdir "$pkgdir"/usr/share/celestia/data
  mkdir "$pkgdir"/usr/share/celestia/textures/lores
  mkdir "$pkgdir"/usr/share/celestia/textures/medres
  mkdir "$pkgdir"/usr/share/celestia/textures/hires
  mkdir "$pkgdir"/usr/share/celestia/extras/textures
  mkdir "$pkgdir"/usr/share/celestia/extras/models
  mkdir "$pkgdir"/usr/share/celestia/extras/textures/medres

  cd "$srcdir"
  cp ./ao7/models/amsat_oscar_7.3ds "$pkgdir"/usr/share/celestia/models/amsat_oscar_7.3ds
  cp ./ao7/AO7.ssc "$pkgdir"/usr/share/celestia/extras/ao7.ssc
  cp ./ao7/textures/medres/panel.jpg "$pkgdir"/usr/share/celestia/textures/lores/panel.jpg
  cp ./chandrasolar.bmp "$pkgdir"/usr/share/celestia/textures/medres/chandrasolar.bmp
  cp ./chandra.3ds "$pkgdir"/usr/share/celestia/models/chandra.3ds
  cp ./JACKchandra.ssc "$pkgdir"/usr/share/celestia/extras/JACKchandra.ssc
  cp ./globalstar.ssc "$pkgdir"/usr/share/celestia/extras/globalstar.ssc
  cp ./iridium.ssc "$pkgdir"/usr/share/celestia/extras/iridium.ssc
  cp ./JACKiso.ssc "$pkgdir"/usr/share/celestia/extras/JACKiso.ssc
  cp ./iso.3ds "$pkgdir"/usr/share/celestia/models/iso.3ds
  cp ./iss.ssc "$pkgdir"/usr/share/celestia/extras/iss.ssc
  cp ./isscomplete.3ds "$pkgdir"/usr/share/celestia/models/isscomplete.3ds
  cp ./JACKspitzer-xyz.ssc "$pkgdir"/usr/share/celestia/extras/JACKspitzer-xyz.ssc
  cp ./sirtf.xyz "$pkgdir"/usr/share/celestia/data/sirtf.xyz
  cp ./spitzer.3ds "$pkgdir"/usr/share/celestia/models/spitzer.3ds
  cp ./gps_big.gif "$pkgdir"/usr/share/celestia/extras/gps_big.gif
  cp ./gps_small.gif "$pkgdir"/usr/share/celestia/extras/gps_small.gif
  cp ./d_ring.bmp "$pkgdir"/usr/share/celestia/textures/hires/d_ring.bmp
  cp ./graple.bmp "$pkgdir"/usr/share/celestia/textures/hires/graple.bmp
  cp ./iss_dc.bmp "$pkgdir"/usr/share/celestia/textures/hires/iss_dc.bmp
  cp ./iss_dcs.bmp "$pkgdir"/usr/share/celestia/textures/hires/iss_dcs.bmp
  cp ./iss_un.bmp "$pkgdir"/usr/share/celestia/textures/hires/iss_un.bmp
  cp ./issb.bmp "$pkgdir"/usr/share/celestia/textures/hires/issb.bmp
  cp ./issb2.bmp "$pkgdir"/usr/share/celestia/textures/hires/issb2.bmp
  cp ./issb3.bmp "$pkgdir"/usr/share/celestia/textures/hires/issb3.bmp
  cp ./issb4.bmp "$pkgdir"/usr/share/celestia/textures/hires/issb4.bmp
  cp ./issbs.bmp "$pkgdir"/usr/share/celestia/textures/hires/issbs.bmp
  cp ./issbso.bmp "$pkgdir"/usr/share/celestia/textures/hires/issbso.bmp
  cp ./issbso2.bmp "$pkgdir"/usr/share/celestia/textures/hires/issbso2.bmp
  cp ./isscov2.bmp "$pkgdir"/usr/share/celestia/textures/hires/isscov2.bmp
  cp ./isscover.bmp "$pkgdir"/usr/share/celestia/textures/hires/isscover.bmp
  cp ./isscup.bmp "$pkgdir"/usr/share/celestia/textures/hires/isscup.bmp
  cp ./issdish.bmp "$pkgdir"/usr/share/celestia/textures/hires/issdish.bmp
  cp ./issdot.bmp "$pkgdir"/usr/share/celestia/textures/hires/issdot.bmp
  cp ./issesa.bmp "$pkgdir"/usr/share/celestia/textures/hires/issesa.bmp
  cp ./isshand.bmp "$pkgdir"/usr/share/celestia/textures/hires/isshand.bmp
  cp ./issins.bmp "$pkgdir"/usr/share/celestia/textures/hires/issins.bmp
  cp ./issku.bmp "$pkgdir"/usr/share/celestia/textures/hires/issku.bmp
  cp ./issku1.bmp "$pkgdir"/usr/share/celestia/textures/hires/issku1.bmp
  cp ./issku2.bmp "$pkgdir"/usr/share/celestia/textures/hires/issku2.bmp
  cp ./issmb.bmp "$pkgdir"/usr/share/celestia/textures/hires/issmb.bmp
  cp ./issmod.bmp "$pkgdir"/usr/share/celestia/textures/hires/issmod.bmp
  cp ./issp2.bmp "$pkgdir"/usr/share/celestia/textures/hires/issp2.bmp
  cp ./isspanel.bmp "$pkgdir"/usr/share/celestia/textures/hires/isspanel.bmp
  cp ./issrad.bmp "$pkgdir"/usr/share/celestia/textures/hires/issrad.bmp
  cp ./issred.bmp "$pkgdir"/usr/share/celestia/textures/hires/issred.bmp
  cp ./isssolar.bmp "$pkgdir"/usr/share/celestia/textures/hires/isssolar.bmp
  cp ./issusa.bmp "$pkgdir"/usr/share/celestia/textures/hires/issusa.bmp
  cp ./issusaf.bmp "$pkgdir"/usr/share/celestia/textures/hires/issusaf.bmp
  cp ./isszmod.bmp "$pkgdir"/usr/share/celestia/textures/hires/isszmod.bmp
  cp ./metalcon.bmp "$pkgdir"/usr/share/celestia/textures/hires/metalcon.bmp
  cp ./nasda.bmp "$pkgdir"/usr/share/celestia/textures/hires/nasda.bmp
  cp ./questcov.bmp "$pkgdir"/usr/share/celestia/textures/hires/questcov.bmp
  cp ./extras/* "$pkgdir"/usr/share/celestia/extras/
  cp ./models/* "$pkgdir"/usr/share/celestia/models/
  cp ./textures/medres/* "$pkgdir"/usr/share/celestia/textures/medres/
  cp ./textures/SAT_01.JPG "$pkgdir"/usr/share/celestia/textures/medres/SAT_01.JPG
  cp ./textures/SAT_02.JPG "$pkgdir"/usr/share/celestia/textures/medres/SAT_02.JPG
  cp ./textures/SAT_03.JPG "$pkgdir"/usr/share/celestia/textures/medres/SAT_03.JPG
  cp ./textures/SAT_04.JPG "$pkgdir"/usr/share/celestia/textures/medres/SAT_04.JPG
  cp -r ./BigHubbleCMOD/* "$pkgdir"/usr/share/celestia/extras/
  cp -r ./BigHubbleCMOD/models/* "$pkgdir"/usr/share/celestia/models/
  cp -r ./BigHubbleCMOD/textures/medres/* "$pkgdir"/usr/share/celestia/textures/medres/
  cp ./Corot/Corot.ssc "$pkgdir"/usr/share/celestia/extras/Corot.ssc
  cp ./Corot/models/corot.3ds "$pkgdir"/usr/share/celestia/extras/models/corot.3ds
  cp ./Corot/textures/medres/* "$pkgdir"/usr/share/celestia/extras/textures/medres/
  cp ./TERRIERS_cmod/TERelelback.gif "$pkgdir"/usr/share/celestia/extras/TERelelback.gif
  cp ./TERRIERS_cmod/TERRIERS.ssc "$pkgdir"/usr/share/celestia/extras/TERRIERS.ssc
  cp ./TERRIERS_cmod/terriers_instrmts.jpg "$pkgdir"/usr/share/celestia/extras/terriers_instrmts.jpg
  cp ./TERRIERS_cmod/models/TERRIERS.cmod "$pkgdir"/usr/share/celestia/models/TERRIERS.cmod
  cp ./TERRIERS_cmod/textures/medres/* "$pkgdir"/usr/share/celestia/textures/medres/
}
