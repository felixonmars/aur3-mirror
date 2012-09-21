# Contributor: Julian Rivera Pineda (xtecuan@NOSPAM.gmail.com)
# Original PKGBUILD by grimi <grimi@poczta.fm>

pkgname=urbanterror-extra-maps
pkgver=4.1
pkgrel=6
pkgdesc="Urban Terror Extra Maps"
arch=('i686' 'x86_64')
url="http://www.urbanferrets.com/UrbanTerror-Map-Downloads.html"
license=('GPL2')
depends=('urbanterror-data')
#conflicts=('urbanterror')
makedepends=('unzip')
#source=("http://95.154.193.127/q3ut4/army.pk3" "http://95.154.193.127/q3ut4/ut4_christmas_a3.pk3" "http://95.154.193.127/q3ut4/farwest.pk3")
source=("http://95.154.193.127/ut_park_avenue_fix.pk3" "http://95.154.193.127/ut_maya_beta3.pk3" "http://95.154.193.127/ut_chicago.pk3" "http://95.154.193.127/ut4_village.pk3" "http://95.154.193.127/ut4_toys_release.pk3" "http://95.154.193.127/ut4_christmas_a3.pk3" "http://95.154.193.127/TheDayAfter2.pk3" "http://95.154.193.127/farwest.pk3" "http://95.154.193.127/army.pk3" "http://95.154.193.127/area51_beta1.pk3" "http://95.154.193.127/q3ut4/fortress.pk3" "http://95.154.193.127/q3ut4/peru.pk3" "http://95.154.193.127/q3ut4/q_1upxmas.pk3" "http://95.154.193.127/q3ut4/ut42_revolution.pk3" "http://95.154.193.127/q3ut4/ut4_baeza.pk3" "http://95.154.193.127/q3ut4/ut4_arena3.pk3" "http://95.154.193.127/q3ut4/ut4_blitzkrieg2.pk3" "http://95.154.193.127/q3ut4/ut4_bridge_rc3.pk3" "http://95.154.193.127/q3ut4/ut4_island.pk3" "http://95.154.193.127/q3ut4/ut4_terrorism.pk3" "http://95.154.193.127/q3ut4/ut_castle.pk3" "http://95.154.193.127/q3ut4/ut_nuclear.pk3")

build() {

	## checkup machine
        [ "$CARCH" = "i686"   ] && ARCH=i386
        [ "$CARCH" = "x86_64" ] && ARCH=x86_64

	## prepare folder
	install -d $pkgdir/opt/urbanterror/q3ut4

        ##clean previous version files
        sudo pacman -R urbanterror-extra-maps

  	
	#install -Dm755 $srcdir/army.pk3 $pkgdir/opt/urbanterror/q3ut4
	#install -Dm755 $srcdir/ut4_christmas_a3.pk3 $pkgdir/opt/urbanterror/q3ut4
	#install -Dm755 $srcdir/farwest.pk3 $pkgdir/opt/urbanterror/q3ut4
	 install -Dm755 $srcdir/area51_beta1.pk3 $pkgdir/opt/urbanterror/q3ut4  
 	install -Dm755 $srcdir/army.pk3 $pkgdir/opt/urbanterror/q3ut4  
 	install -Dm755 $srcdir/farwest.pk3 $pkgdir/opt/urbanterror/q3ut4  
 	install -Dm755 $srcdir/TheDayAfter2.pk3 $pkgdir/opt/urbanterror/q3ut4  
 	install -Dm755 $srcdir/ut4_christmas_a3.pk3 $pkgdir/opt/urbanterror/q3ut4  
 	install -Dm755 $srcdir/ut4_toys_release.pk3 $pkgdir/opt/urbanterror/q3ut4  
 	install -Dm755 $srcdir/ut4_village.pk3 $pkgdir/opt/urbanterror/q3ut4  
 	install -Dm755 $srcdir/ut_chicago.pk3 $pkgdir/opt/urbanterror/q3ut4  
 	install -Dm755 $srcdir/ut_maya_beta3.pk3 $pkgdir/opt/urbanterror/q3ut4  
 	install -Dm755 $srcdir/ut_park_avenue_fix.pk3 $pkgdir/opt/urbanterror/q3ut4 
 	install -Dm755 $srcdir/fortress.pk3 $pkgdir/opt/urbanterror/q3ut4
	install -Dm755 $srcdir/peru.pk3 $pkgdir/opt/urbanterror/q3ut4
	install -Dm755 $srcdir/q_1upxmas.pk3 $pkgdir/opt/urbanterror/q3ut4
	install -Dm755 $srcdir/ut42_revolution.pk3 $pkgdir/opt/urbanterror/q3ut4
	install -Dm755 $srcdir/ut4_baeza.pk3 $pkgdir/opt/urbanterror/q3ut4
	install -Dm755 $srcdir/ut4_arena3.pk3 $pkgdir/opt/urbanterror/q3ut4
	install -Dm755 $srcdir/ut4_blitzkrieg2.pk3 $pkgdir/opt/urbanterror/q3ut4
	install -Dm755 $srcdir/ut4_bridge_rc3.pk3 $pkgdir/opt/urbanterror/q3ut4
	install -Dm755 $srcdir/ut4_island.pk3 $pkgdir/opt/urbanterror/q3ut4
	install -Dm755 $srcdir/ut4_terrorism.pk3 $pkgdir/opt/urbanterror/q3ut4
	install -Dm755 $srcdir/ut_castle.pk3 $pkgdir/opt/urbanterror/q3ut4
	install -Dm755 $srcdir/ut_nuclear.pk3 $pkgdir/opt/urbanterror/q3ut4 

	
}

#md5sums=('6f9a767a0448b216a37ad5c2d6fa0db2' '832f782ce0a2e60c672eb3dc5ba4abcc' '1699233a2dfbc26f2efa17e93d3f9159')
md5sums=('f257a278dc1fce4462d4da40aa6220bc' 'af71dada3d2b8e5015244e3dc07f5ddc' '1f103e82dd81a95c418c85cc57bda4fe' 'db0c283d6e25bcc95c208eb108f4a898' 'c8d7bb6692f95c0bd9259ab207a623fe' '832f782ce0a2e60c672eb3dc5ba4abcc' '05547f1025fdfc312a8d3c5ee950b9ce' '1699233a2dfbc26f2efa17e93d3f9159' '6f9a767a0448b216a37ad5c2d6fa0db2' '75e37fd346f199ac6fe648249c2752c0' '157625ba9800cb2bf77f099eec15b3ce' 'ac7fa23e2e7e1869c1863630eb4a1d39' '3faa9019934817110e07dd6a9c887b46' '958c54ff37b9d4f73867d32d664bc84b' 'c7d421348d09ebe5b3239ac4e95a94ea' 'aedadcff5b7e9008aa6b88e916d8742d' '21a49f310831843d2ecba4dc62be1864' 'f45080bc99c0f71bb0b0f1d199816f36' 'da143c6dd6a8dbc292535b1a05b27d04' '259aa3cdd608b543dc5914c46c29d821' '45cb0242020cd466cd6ace568d9b88b1' '2a5ed885515d03dbbb9f64b69b560323')
