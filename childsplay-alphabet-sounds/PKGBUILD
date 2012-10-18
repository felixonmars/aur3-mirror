# Maintainer: Miguel Aguilar <zodiac_es at yahoo dot es>
# Contributor: Jakob Nixdorf <jakob.nixdorf@online.de>
pkgname=childsplay-alphabet-sounds
pkgver=0.9.1
pkgrel=1
pkgdesc="A suite of educational games for young children -- Sound Translations"
url="http://www.schoolsplay.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('childsplay>=1.3')
source=(http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_ca-0.9.1.tgz
	http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_el-0.9.tgz
	http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_de-0.9.1.tgz
	http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_es-0.9.1.tgz
	http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_fr-0.9.1.tgz
	http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_it-0.9.1.tgz
	http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_nl-0.9.1.tgz
	http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_pt-0.9.1.tgz
	http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_ru-0.9.1.tgz
	http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_sl-0.9.1.tgz
	http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_sv-0.9.2.tgz
        http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_bg-0.9.1.tgz
        http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_ro-0.9.1.tgz
        http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_nb-0.9.1.tgz 
        http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_en_GB-0.9.1.tgz
        http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_lt-0.9.1.tgz
        http://downloads.sourceforge.net/schoolsplay/alphabet_sounds_pt_BR-0.9.1.tgz
)

md5sums=(f262b6db7734d4c4c9507514ba4ca02e 
	 4c14070cdc31ae4963bed1c3df955c8f  
	 7088f35d6746a12f01d782ee749b1818  
	 959ba7c2e922ba7d7f939d0b5edaa166
	 a7b6b136671d08f82b00160ebb9beff4
	 6a6c510249f3fc0f4d626937cfc215be 
         06c4a4a3906b09cd6e8f43e6493bcbd6
         74f938723bf150f397cf1661cb959cc2	  
	 1023b6dd5bdf70eaa037b39a63360d49
	 04508ccba7a2cafe7b3485ee9539a730
	 61e12b63ef23a5cf4168e8a60d1a519a
	 afc19d0df7e89aa469f6f0553ca691e9
	 02258080de77aeb13d1d34e8f5f44a52
	 745054a52ae61954312d1e78ba12aa27
	 8461abeb41b202bc56778395f9ce46f2
	 3e1a5f60bfadf2134de360b66960ee5b
	 10ac35d699dcedfffd9bf82a81e5ebbd
)
	 
build() {
cd ${srcdir}
mkdir -p ${pkgdir}/usr/share/{sp_alphabetsounds,childsplay_sp/CPData/FlashcardsData/names}
cp -rf alphabet_sounds_ca-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_el-0.9/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_de-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_es-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_fr-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_it-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_nl-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_pt-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_ru-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_sl-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_sv-0.9.2/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_bg-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_ro-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_nb-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_en_GB-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_lt-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/
cp -rf alphabet_sounds_pt_BR-0.9.1/AlphabetSounds/* ${pkgdir}/usr/share/sp_alphabetsounds/


cp -rf alphabet_sounds_ca-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
cp -rf alphabet_sounds_de-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
cp -rf alphabet_sounds_es-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
cp -rf alphabet_sounds_fr-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
cp -rf alphabet_sounds_it-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
cp -rf alphabet_sounds_nl-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
# cp -rf alphabet_sounds_pt-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
cp -rf alphabet_sounds_ru-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
cp -rf alphabet_sounds_sl-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
# cp -rf alphabet_sounds_sv-0.9.2/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
# cp -rf alphabet_sounds_bg-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
# cp -rf alphabet_sounds_ro-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
# cp -rf alphabet_sounds_nb-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
# cp -rf alphabet_sounds_en_GB-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
# cp -rf alphabet_sounds_lt-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
cp -rf alphabet_sounds_pt_BR-0.9.1/FlashCardsSounds/* ${pkgdir}/usr/share/childsplay_sp/CPData/FlashcardsData/names/
}
