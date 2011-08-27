# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
pkgname=gnome-backgrounds-qwak
pkgver=1
pkgrel=1
pkgdesc="Some nice nature background images for GNOME from art.gnome.org"
arch=(i686 x86_64)
makedepends=()
url="http://art.gnome.org"
license=()
groups=('gnome')
source=(
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-AnotherGrass_1600x1200.jpg
    http://art.gnome.org/download/backgrounds/nature/1319/NATURE-GreenField_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-SyltSunset_1600x1200.png
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-FallOak_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-PolandDorozkiMorning01_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-AfterTheStormBlue_1280x1024.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-SadTree_1024x768.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-WaitingForSunset_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-YARBYetAnotherRoseBackground_1280x1024.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-DewyGrassI_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-GreenGNOMENoLogo_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-SkyStone_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/OTHER-SmolovSummer2004_1280x1024.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-IsArutas_1024x768.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-Smaland_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-MonasterioDePiedra_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-WinterAlsaceFrance_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-NaturalFootGnome_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-MauiView1_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-SunsetAtRiverDanube_1600x1200.png
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-PebbleBeach_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-MontLeSoie_1280x1024.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-SouthwestSunset_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-PlasPowerWoods_1280x1024.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-MeanderingRiver_1024x768.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-LogOnShore_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-SunsetPetten_1280x1024.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-FrozenDew_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-Tranquility_1024x768.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-Allgaeu_1280x1024.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-LimetItaly_1280x1024.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-EveningInDublin_1920x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-Sella_1600x1200.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-FakaravaCoconutTree_1280x1024.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-FrozenBubble_1280x1024.jpg
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-SantaFeSunset1600x1200_1600x1200.png
    http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/backgrounds/NATURE-Clouds_1280x1024.jpg
)

build() {

# Copy images:
local pkgdir=$startdir/pkg
local bgdir=/usr/share/pixmaps/backgrounds/qwak/nature
local dstdir="${pkgdir}${bgdir}"
install -d $dstdir
install -m644 $startdir/src/* $dstdir

# Create GNOME configuration xml file:
install -d $pkgdir/usr/share/gnome-background-properties/
local xmlfilename=$pkgdir/usr/share/gnome-background-properties/gnome-nature-qwak.xml

cat > $xmlfilename <<END-OF-MESSAGE
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
END-OF-MESSAGE

cd $dstdir
for i in *;
do
local name=${i%.*}
name=${name//-/ }
name=${name//_/ }
cat >> $xmlfilename <<END-OF-MESSAGE
    <wallpaper deleted="false">
	<name>${name}</name>
	<filename>$bgdir/$i</filename>
	<options>zoom</options>
    </wallpaper>
END-OF-MESSAGE

done

cat >> $xmlfilename <<END-OF-MESSAGE
</wallpapers>
END-OF-MESSAGE

}

md5sums=('99d3c7162214bb0e6a6806c95e52ce3b'
         '62c6a6f743c08635af5b13060a591e45'
         '56e1e9a37acde367282a05e24834ef3e'
         '243da1d6b4cff3e8708e3734cd502ea9'
         'e14042523200c6e9ab403534a61a09b8'
         '2f3ccf4028ef53c4c256c98b05089d73'
         '45bb7264cc8ae550ebe22a4e27ba3226'
         '4b4c9b750e8845c83b9dcfb913d0b73d'
         'cca984b582f5229e70291c8fefad250a'
         'e6966adecd266e55c84e33c5014f6437'
         '4738891e5533b6eea69ee75786cbfc7d'
         '3db79bfb362bf582581295d82bab1c59'
         '4b9ac70ade2f9d9ed99a2709883a861d'
         '01c88c5ae30b1a1df93c185a61adfbc5'
         'f3f845c87385dab42021961969778b0f'
         '5b7abf16cc7b64725ed8638af3ecb6e4'
         '383b97788cc0b4fa0cd52f8fd735f53b'
         '88c5f4d49003b13d7b905046b663d8ff'
         '77f19a66188ff84ab5b62d07a9cf0138'
         '5638aeca14c6a670a009bd12b4eba054'
         'bbe9e48b97fdc18bebe11409e9af5f46'
         'c8ea5ba25b8cf39e0dbd5dbda39bc7e3'
         'b5e920c7799dd7dd7ab999bd3b7e0d6c'
         '4821e283297c30de569d94d634f9b99e'
         '518187cc648f03d33e0797afb066efa8'
         '658a1e61564c7647931326904744231a'
         '38ce5d6cbcdb87cb83aa9abaf8e788a9'
         '6b4dab44287688a06e6d920ae215bfdd'
         '9e853f49155b60384779353a38f529f8'
         'd2c398e788a70cc7a2f42a8f5ce8d7b2'
         'd8454361c2050272baf44391998a4659'
         '45f2f2822a0ac3d7347364872f6294cc'
         'ef932f0710a3d93b031f49e2ffc83559'
         'ca1c2ee3791da4f874ee9eedb509114a'
         '09f690639ec7fb4b61501c152c7f8106'
         '11282860d8b49bbf5d4c54ceed0f3c5b'
         'b48b3817406991c51f2cb25ed9c7298b')
