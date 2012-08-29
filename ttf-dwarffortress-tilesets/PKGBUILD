# Maintainer: Marshall Mattingly III <mattinm.code@gmail.com>
pkgname=ttf-dwarffortress-tilesets
_pkgname="DF Fonts"
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
pkgdesc="Fonts based on uploads to the tileset repository. Edit PKGBUILD to included the desired fonts."
arch=('any')
license=('unknown')
url="http://dffd.wimbli.com/file.php?id=1922"
source=("${_pkgname}.zip::http://dffd.wimbli.com/download.php?id=1922&f=DF+Fonts.zip")
noextract=("${_pkgname}.zip")
install=$pkgname.install
md5sums=('7f0aa00b8b68107c45dcd46cc64e9f01')

build() {
    # USE THIS SECTION TO SELECT THE FONTS YOU WANT INSTALLED
    _fonts=(
    #DF_Aesomatica_16x16.ttf
    #DF_Anikki_10x10.ttf
    #DF_Anikki_16x16.ttf
    #DF_Anikki_8x8.ttf
    #DF_Bisasam_16x16.ttf
    #DF_Chinkeeyong_10x12.ttf
    #DF_Cooz_16x16_Flat.ttf
    #DF_Cooz_16x16.ttf
    #DF_Curses_10x12.ttf
    #DF_Curses_8x12.ttf
    #DF_Dorten_9x9.ttf
    #DF_Eagle_of_Fire_10x12.ttf
    #DF_Gekz_11x11.ttf
    #DF_Guybrush_16x16_Herrbdog.tt
    #DF_Guybrush_16x16.ttf
    #DF_Hanuman_12x12x.ttf
    #DF_Herrbdog_12x12.ttf
    #DF_Herrbdog_16x16.ttf
    #DF_Herrbdog_7x7.ttf
    #DF_Inquisitor_Saturn_16x16.ttf
    #DF_Jackard_16x16.ttf
    #DF_Kaishaku_16x16.ttf
    #DF_Kein_5x5.ttf
    #DF_Kein_8x12.ttf
    #DF_Kelora_16x16.ttf
    #DF_Klokjammer_16x16_v1.ttf
    #DF_Klokjammer_16x16_v2.ttf
    #DF_Lord_Dullard_12x12_Exponent.ttf
    #DF_Lord_Nightmare_10x16_FHv1.ttf
    #DF_Lord_Nightmare_10x16_FHv2.ttf
    #DF_Lord_Nightmare_4x6_Terminal.ttf
    #DF_Lord_Nightmare_6x6_v1.ttf
    #DF_Lord_Nightmare_6x6_v2.ttf
    #DF_Lord_Nightmare_8x14_EGA.ttf
    #DF_Lord_Nightmare_8x14_MDA.ttf
    #DF_Lord_Nightmare_8x16_Fixedsys.ttf
    #DF_Lord_Nightmare_8x16_VGA.ttf
    #DF_Lord_Nightmare_8x8_Thick.ttf
    #DF_Lord_Nightmare_8x8_Thin.ttf
    #DF_Lord_Nightmare_8x8.ttf
    #DF_Lord_Nightmare_9x14_EGA.ttf
    #DF_Lord_Nightmare_9x14_MDA.ttf
    #DF_Marble_Dice_16x16.ttf
    #DF_Markavian_12x12_v1.ttf
    #DF_Markavian_12x12_v2.ttf
    #DF_Markavian_6x6_v1.ttf
    #DF_Markavian_6x6_v2.ttf
    #DF_Maus_9x9.ttf
    #DF_Mayday_16x16_Max.ttf
    #DF_Mayday_16x16_Mix.ttf
    #DF_Mayday_16x16.ttf
    #DF_Nobbins_6x6.ttf
    #DF_Paul_10x10.ttf
    #DF_Plac1d_8x12.ttf
    #DF_PTTG_16x16.ttf
    #DF_Random832_16x16.ttf
    #DF_RavingManiac_16x16.ttf
    #DF_Sappho_16x16.ttf
    #DF_Savok_16x16.ttf
    #DF_Savok_9x9.ttf
    #DF_Sergius_10x12.ttf
    #DF_Super_Foul_Egg_16x16.ttf
    #DF_Tae_8x16_VGA.ttf
    #DF_Tahin_16x16.ttf
    #DF_Taritus_8x12.ttf
    #DF_Techhead_16x16.ttf
    #DF_Terbert_10x10.ttf
    #DF_Terbert_7x7.ttf
    #DF_Tocky_10x10.ttf
    #DF_Turnip_12x12.ttf
    #DF_Tyrving_16x16.ttf
    #DF_UncleSporky_10x12.ttf
    #DF_Unknown_12x12_v1.ttf
    #DF_Unknown_12x12_v2.ttf
    #DF_Winterwing_16x16.ttf
    #DF_Xenomorph_8x16.ttf
    #DF_Xenomorph_8x8.ttf
    #DF_Yayo_13x13.ttf
    #DF_Yayo_16x16.ttf
    #DF_Yayo_8x8.ttf
    #DF_Zaratustra_10x12.ttf
    #DF_Zaratustra_16x16.ttf
    #DF_Zaratustra_4x6.ttf
    #DF_Zaratustra_5x5.ttf
    #DF_Zaratustra_5x6.ttf
    #DF_Zaratustra_8x14.ttf
    #DF_Zaratustra_8x8.ttf
    )
    # END OF FONTS

    # create the TTF folder
    mkdir -p $pkgdir/usr/share/fonts/TTF

    # unzip the font
    cd $srcdir
    unzip "${_pkgname}.zip"

    # copy all the selected fonts from source to TTF
    for ttf in "${_fonts[@]}"; do
        cp "$srcdir/${_pkgname}/$ttf" $pkgdir/usr/share/fonts/TTF
    done
}
