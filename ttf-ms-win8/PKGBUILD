# Maintainer: reflexing <reflexing@reflexing.ru>
#
# BUILD INSTRUCTIONS:
# ----------------------
# This package is based on 'ttf-win7-fonts' package with fixes,
# suggested by AUR's 'severach' user in comments.
#
# It is intended as a more up-to-date replacement for the AUR's
# 'ttf-ms-fonts', 'ttf-vista-fonts' and 'ttf-win7-fonts' packages.
# It provides newer versions of the fonts in these packages, but due
# to license issues cannot automatically download the fonts.
#
# Please note, that usage of Microsoft fonts outside running Windows
# system is prohibited by EULA (although in certain countries EULA is invalid).
# Please consult Microsoft license before using fonts.
#
# You can acquire fonts either from an installed Windows 8 RTM system
# or install medium. Any edition of Windows 8 build 6.2.9200.16384 will work.
#
# On the installed Windows 8 system fonts are usually located in
#       C:\Windows\Fonts
#
# How to acquire fonts from Windows 8 RTM install medium:
#
#    You can freely download Windows 8 Enterprise 90-day evaluation
#    for developers from:
#       http://msdn.microsoft.com/en-US/evalcenter/jj554510.aspx
#
#    Fonts are located in 'sources/install.wim' on the ISO, which
#    is a 'Windows Imaging Format' (WIM) archive.
#
#    This archive can be extracted with 7-zip ('p7zip' package in repos)
#    running the following commands in the dir, containing ISO
#   (make necessary changes if needed):
#
#       7z e Windows_8_Pro_EN-US_x64.ISO sources/install.wim
#       7z e install.wim 1/Windows/Fonts/{*.ttf,cambria.ttc} -ofonts
#
#    Fonts will be located in the 'fonts' dir.
#
#    You can also use GNOME's File Roller (and maybe other archive
#    managers) to extract the files if the 'p7zip' package is installed.
#
#    Alternatively, you can extract WIM using imagex
#   ('wimlib' package from AUR).
#
#    Put the following script together with previously extracted
#   'install.wim' and execute:
#
#       #!/bin/sh
#       mkdir tmp fonts
#       imagex mount install.wim 1 tmp
#       cp tmp/Windows/Fonts/{*.ttf,cambria.ttc} fonts
#       imagex unmount tmp
#
#    Fonts will be located in the 'fonts' dir.
#
# Fonts are best viewed with Infinality freetype2 packages:
#   https://wiki.archlinux.org/index.php/Font_Configuration#Infinality
# Infinality offers great font rendering and customization.
#
# You need the files listed in the source=() array. Place them in the same
# directory as this PKGBUILD file, then run makepkg.

pkgbase=ttf-ms-win8
pkgname=$pkgbase
true && pkgname=($pkgbase $pkgbase-arabic $pkgbase-hebrew
    $pkgbase-SEA $pkgbase-indic $pkgbase-japanese $pkgbase-korean
    $pkgbase-zh_CN $pkgbase-zh_TW $pkgbase-thai $pkgbase-other)

pkgver=6.2.9200.16384
pkgrel=5
pkgdesc='Microsoft Windows 8 TrueType fonts'
arch=('any')
url='http://www.microsoft.com/typography/fonts/product.aspx?PID=164'
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale' 'xorg-mkfontdir')
makedepends=('fontforge')
provides=('ttf-win7-fonts' 'ttf-vista-fonts' 'ttf-ms-fonts' 'ttf-tahoma')
conflicts=('ttf-win7-fonts' 'ttf-vista-fonts' 'ttf-ms-fonts' 'ttf-tahoma')
install="$pkgbase.install"
PKGEXT='.pkg.tar'

_ttf_ms_win8=(
#####################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name           Version  Comment #
#####################################################################################################
arial.ttf      arialbd.ttf    ariali.ttf     arialbi.ttf    # Arial                   6.80
ariblk.ttf                                                  # Arial Black             5.21
comic.ttf      comicbd.ttf    comici.ttf     comicz.ttf     # Comic Sans MS           5.11
cour.ttf       courbd.ttf     couri.ttf      courbi.ttf     # Courier New             6.80
framd.ttf                     framdit.ttf                   # Franklin Gothic Medium  5.01
                                                            #   Italic                5.00
Gabriola.ttf                                                # Gabriola                5.92
georgia.ttf    georgiab.ttf   georgiai.ttf   georgiaz.ttf   # Georgia                 5.51
impact.ttf                                                  # Impact                  5.10
lucon.ttf                                                   # Lucida Console          5.00
l_10646.ttf                                                 # Lucida Sans Unicode     5.00
marlett.ttf                                                 # Marlett                 5.00 Symbol
micross.ttf                                                 # Microsoft Sans Serif    5.10
pala.ttf       palab.ttf      palai.ttf      palabi.ttf     # Palatino Linotype       5.01
segoepr.ttf    segoeprb.ttf                                 # Segoe Print             5.02
segoesc.ttf    segoescb.ttf                                 # Segoe Script            5.00
segoeui.ttf    segoeuib.ttf   segoeuii.ttf   segoeuiz.ttf   # Segoe UI                5.28
                                                            #   Bold                  5.27
                                                            #   Italic                5.26
                                                            #   Bold Italic           5.26
segoeuil.ttf                  seguili.ttf                   # Segoe UI Light          5.27
                                                            #   Italic                5.26
seguisb.ttf                   seguisbi.ttf                  # Segoe UI Semibold       5.27
                                                            #   Italic                5.26
segoeuisl.ttf                 seguisli.ttf                  # Segoe UI Semilight      5.27
                                                            #   Italic                5.26
seguisym.ttf                                                # Segoe UI Symbol         5.90
sylfaen.ttf                                                 # Sylfaen                 5.03
symbol.ttf                                                  # Symbol                  5.00
tahoma.ttf     tahomabd.ttf                                 # Tahoma                  5.25
times.ttf      timesbd.ttf    timesi.ttf     timesbi.ttf    # Times New Roman         6.80
trebuc.ttf     trebucbd.ttf   trebucit.ttf   trebucbi.ttf   # Trebuchet MS            5.10
verdana.ttf    verdanab.ttf   verdanai.ttf   verdanaz.ttf   # Verdana                 5.31
                                                            #   Bold                  5.30
                                                            #   Italic                5.30
                                                            #   Bold Italic           5.30
webdings.ttf                                                # Webdings                5.00 Symbol
wingding.ttf                                                # Wingdings               5.00 Symbol
)

_vista=(
#####################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name           Version  Comment #
#####################################################################################################
calibri.ttf    calibrib.ttf   calibrii.ttf   calibriz.ttf   # Calibri                 5.72
calibril.ttf                  calibrili.ttf                 # Calibri Light           2.00
cambria.ttc    cambriab.ttf   cambriai.ttf   cambriaz.ttf   # Cambria                 6.80
#cambria.ttc                                                # Cambria Math            6.80
Candara.ttf    Candarab.ttf   Candarai.ttf   Candaraz.ttf   # Candara                 5.61
consola.ttf    consolab.ttf   consolai.ttf   consolaz.ttf   # Consolas                5.32
constan.ttf    constanb.ttf   constani.ttf   constanz.ttf   # Constantia              5.90
corbel.ttf     corbelb.ttf    corbeli.ttf    corbelz.ttf    # Corbel                  5.61
)

_SEA=(
#####################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name           Version  Comment #
#####################################################################################################
daunpenh.ttf                                                # DaunPenh                5.00 Khmer
dokchamp.ttf                                                # DokChampa               5.00 Lao
KhmerUI.ttf    KhmerUIb.ttf                                 # Khmer UI                5.02 Khmer
LaoUI.ttf      LaoUIb.ttf                                   # Lao UI                  5.01 Lao
himalaya.ttf                                                # Microsoft Himalaya      5.06 Tibetan
ntailu.ttf     ntailub.ttf                                  # Microsoft New Tai Lue   5.96 Tai Lue
phagspa.ttf    phagspab.ttf                                 # Microsoft PhagsPa       5.96 Phags-pa
taile.ttf      taileb.ttf                                   # Microsoft Tai Le        5.96 Tai Le
msuighur.ttf   msuighub.ttf                                 # Microsoft Uighur        5.93 Uighur
msyi.ttf                                                    # Microsoft Yi Baiti      5.97 Yi Script
moolbor.ttf                                                 # MoolBoran               5.00 Khmer
monbaiti.ttf                                                # Mongolian Baiti         5.10 Mongolian
mmrtext.ttf                                                 # Myanmar Text            1.00 Myanmar
Nirmala.ttf    NirmalaB.ttf                                 # Nirmala UI              1.01 South Asian scripts (Bangla, Devanagari, Gujarati, Malayalam, Odia, Telugu)
)

_indic=(
#####################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name           Version  Comment #
#####################################################################################################
aparaj.ttf     aparajb.ttf    aparaji.ttf    aparajbi.ttf   # Aparajita               5.92 Hindi
gautami.ttf    gautamib.ttf                                 # Gautami                 5.94 Indic script — Telugu
kalinga.ttf    kalingab.ttf                                 # Kalinga                 5.95 Oriya
kartika.ttf    kartikab.ttf                                 # Kartika                 5.95 Indic script — Malayalam
kokila.ttf     kokilab.ttf    kokilai.ttf    kokilabi.ttf   # Kokila                  5.92 Hindi
latha.ttf      lathab.ttf                                   # Latha                   5.94 Indic script — Tamil
mangal.ttf     mangalb.ttf                                  # Mangal                  5.94 Indic script — Devanagari
raavi.ttf      raavib.ttf                                   # Raavi                   5.94 Indic script — Gurmukhi
shruti.ttf     shrutib.ttf                                  # Shruti                  5.94 Indic script — Gujarati
tunga.ttf      tungab.ttf                                   # Tunga                   5.94 Indic script — Kannada
utsaah.ttf     utsaahb.ttf    utsaahi.ttf    utsaahbi.ttf   # Utsaah                  5.92 Hindi
Vani.ttf       Vanib.ttf                                    # Vani                    6.80 Indic script — Telugu
vrinda.ttf     vrindab.ttf                                  # Vrinda                  6.80 Indic script — Bengali
vijaya.ttf     vijayab.ttf                                  # Vijaya                  6.80 Tamil
Shonar.ttf     Shonarb.ttf                                  # Shonar Bangla           6.80 Bengali
iskpota.ttf    iskpotab.ttf                                 # Iskoola Pota            5.94 Sinhala
)

#Chinese (Simplified)
_zh_CN=(
#####################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name           Version  Comment #
#####################################################################################################
simkai.ttf                                                  # KaiTi                   5.01 Simplified Chinese
simsun.ttc                                                  # NSimSun                 5.04 Simplified Chinese
simhei.ttf                                                  # SimHei                  5.03 Simplified Chinese font features plain strokes similar to sans serif designs
#simsun.ttc                                                 # SimSun                  5.04 Simplified Chinese font features mincho (serif) stroke style
simsunb.ttf                                                 # SimSun-ExtB             5.01
simfang.ttf                                                 # FangSong                5.01 Simplified Chinese
msyh.ttc       msyhbd.ttc                                   # Microsoft YaHei         6.10 Simplified Chinese
#msyh.ttc      msyhbd.ttc                                   # Microsoft YaHei UI      6.10 Simplified Chinese
)

#Chinese (Traditional)
_zh_TW=(
#####################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name           Version  Comment #
#####################################################################################################
kaiu.ttf                                                    # DFKai-SB                5.00 Serif style with Traditional Chinese support. DFKai-SB has graceful strokes
msjh.ttc       msjhbd.ttc                                   # Microsoft JhengHei      6.10 Chinese: Traditional chars — Taiwan and Hong Kong
#msjh.ttc      msjhbd.ttc                                   # Microsoft JhengHei UI   6.10
mingliu.ttc                                                 # MingLiU                 7.01 Traditional Chinese font in a mincho (serif) stroke style
#mingliu.ttc                                                # MingLiU_HKSCS           7.01
mingliub.ttc                                                # MingLiU_HKSCS-ExtB      7.01
#mingliub.ttc                                               # MingLiU-ExtB            7.01
#mingliu.ttc                                                # PMingLiU                7.01 Traditional Chinese font that features a mincho (serif) stroke style with proportional Latin characters
#mingliub.ttc                                               # PMingLiU-ExtB           7.01
)

_japanese=(
#####################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name           Version  Comment #
#####################################################################################################
meiryo.ttc     meiryob.ttc    #meiryo.ttc    meiryob.ttc    # Meiryo                  6.12 Japanese and Roman
#meiryo.ttc    meiryob.ttc    meiryo.ttc     meiryob.ttc    # Meiryo UI               6.12
msgothic.ttc                                                # MS Gothic               5.10 Japanese font features plain strokes similar to sans serif designs
msmincho.ttc                                                # MS Mincho               5.10 Japanese font that features serifs at the end of its strokes
#msgothic.ttc                                               # MS PGothic              5.10 Japanese font with proportional latin in the gothic (sans serif) style
#msmincho.ttc                                               # MS PMincho              5.10 Japanese font with proportional latin in the mincho (serif) style
#msgothic.ttc                                               # MS UI Gothic            5.10 The default glyph shapes of this font are based on JIS2004. This font also provides access to a set of JIS90 legacy glyphs via jp90' OpenType layout table.
)

_korean=(
#####################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name           Version  Comment #
#####################################################################################################
batang.ttc                                                  # Batang                  5.00 Korean font that features a mincho (serif) stroke style
#batang.ttc                                                 # BatangChe               5.00
gulim.ttc                                                   # Dotum                   5.00 Korean
#gulim.ttc                                                  # DotumChe                5.00
#gulim.ttc                                                  # Gulim                   5.01 Korean
#gulim.ttc                                                  # GulimChe                5.00 Korean
#batang.ttc                                                 # Gungsuh                 5.00 Korean
#batang.ttc                                                 # GungsuhChe              5.00 Korean
malgun.ttf     malgunbd.ttf                                 # Malgun Gothic           6.22 Korean
)

_arabic=(
#####################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name           Version  Comment #
#####################################################################################################
aldhabi.ttf                                                 # Aldhabi                 1.00 Arabic, Latin
andlso.ttf                                                  # Andalus                 5.99 Arabic, Latin
arabtype.ttf                                                # Arabic Typesetting      5.92 Arabic, Latin
majalla.ttf    majallab.ttf                                 # Sakkal Majalla          6.80 Arabic font based on Naskh calligraphy
simpo.ttf      simpbdo.ttf                                  # Simplified Arabic       5.98 Arabic
simpfxo.ttf                                                 # Simplified Arabic Fixed 5.92
trado.ttf      tradbdo.ttf                                  # Traditional Arabic      5.98 Arabic
UrdType.ttf                                                 # Urdu Typesetting        5.93 Arabic
)

_hebrew=(
#####################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name           Version  Comment #
#####################################################################################################
               ahronbd.ttf                                  # Aharoni Bold            5.02 Hebrew, Latin
david.ttf      davidbd.ttf                                  # David                   5.02 Hebrew
frank.ttf                                                   # FrankRuehl              5.02 Hebrew
gisha.ttf      gishabd.ttf                                  # Gisha                   5.01 Hebrew
lvnm.ttf       lvnmbd.ttf                                   # Levenim MT              5.03 Hebrew
mriam.ttf                                                   # Miriam                  5.02 Hebrew
mriamc.ttf                                                  # Miriam Fixed            5.02
nrkis.ttf                                                   # Narkisim                5.02 Hebrew
rod.ttf                                                     # Rod                     5.02 Hebrew
)

_thai=(
#####################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name           Version  Comment #
#####################################################################################################
angsa.ttf      angsab.ttf     angsai.ttf     angsaz.ttf     # Angsana New             5.00 Thai, Latin
angsau.ttf     angsaub.ttf    angsaui.ttf    angsauz.ttf    # AngsanaUPC              5.00 Thai, Latin
browa.ttf      browab.ttf     browai.ttf     browaz.ttf     # Browallia New           5.00 Thai
browau.ttf     browaub.ttf    browaui.ttf    browauz.ttf    # BrowalliaUPC            5.00 Thai
cordia.ttf     cordiab.ttf    cordiai.ttf    cordiaz.ttf    # Cordia New              5.00 Thai
cordiau.ttf    cordiaub.ttf   cordiaui.ttf   cordiauz.ttf   # CordiaUPC               5.00
upcdl.ttf      upcdb.ttf      upcdi.ttf      upcdbi.ttf     # DilleniaUPC             5.01 Thai
upcel.ttf      upceb.ttf      upcei.ttf      upcebi.ttf     # EucrosiaUPC             5.01 Thai
upcfl.ttf      upcfb.ttf      upcfi.ttf      upcfbi.ttf     # FreesiaUPC              5.01 Thai
upcil.ttf      upcib.ttf      upcii.ttf      upcibi.ttf     # IrisUPC                 5.01 Thai
upcjl.ttf      upcjb.ttf      upcji.ttf      upcjbi.ttf     # JasmineUPC              5.01 Thai
upckl.ttf      upckb.ttf      upcki.ttf      upckbi.ttf     # KodchiangUPC            5.01 Thai
leelawad.ttf   leelawdb.ttf                                 # Leelawadee              5.05 Thai
upcll.ttf      upclb.ttf      upcli.ttf      upclbi.ttf     # LilyUPC                 5.01 Thai
)

_other=(
#####################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name           Version  Comment #
#####################################################################################################
ebrima.ttf     ebrimabd.ttf                                 # Ebrima                  5.06 African
estre.ttf                                                   # Estangelo Edessa        5.00 Syriac
euphemia.ttf                                                # Euphemia                5.05 Unified Canadian Syllabics
gadugi.ttf     gadugib.ttf                                  # Gadugi                  1.03 Unified Canadian Aboriginal Syllabics
nyala.ttf                                                   # Nyala                   5.01 Ethiopic, Latin
plantc.ttf                                                  # Plantagenet Cherokee    5.07 Cherokee
mvboli.ttf                                                  # MV Boli                 5.01 Thaana, Maldivian
)

source=( ${_ttf_ms_win8[@]} ${_vista[@]} ${_arabic[@]} ${_hebrew[@]} ${_SEA[@]} ${_korean[@]} ${_japanese[@]} ${_zh_CN[@]} ${_zh_TW[@]} ${_indic[@]} ${_thai[@]} ${_other[@]} license.rtf)

function build {
    cd "$srcdir"

    # Tabs are essential!
    # Шmportant: use real tab characters!
	ff_script=$(cat <<-'SETVAR'
	i = 1
	while (i < $argc)
		theFontNames = FontsInFile($argv[i])
		cnt = SizeOf(theFontNames)
		j = 0
		while (j < cnt)
			thefontname = theFontNames[j]
			thisPath = $argv[i] + "(" + thefontname + ")"
			Open(thisPath, 1)
			Generate(thefontname + ".ttf")
			Close()
			j++
		endloop
		i = i+1
	endloop
	SETVAR)

    # Ignoring until FontForge devs resolve segfaults
    GLOBIGNORE=batang.ttc:gulim.ttc:meiryob.ttc:meiryo.ttc:mingliub.ttc:mingliu.ttc:msgothic.ttc:msjhbd.ttc:msjh.ttc:msmincho.ttc:msyhbd.ttc:msyh.ttc:simsun.ttc

    # Quotes are essential!
    fontforge -lang=ff -c "$ff_script" *.ttc
}

function _package {
    cd "$srcdir"

    # Array name can't have underscores… thus this check
    if [ "$1" = "$pkgbase" ]; then
        fonts_array_name=_${pkgbase//-/_}[@];
    else
        fonts_array_name=_${1#${pkgbase}-}[@];
    fi

    fonts=${!fonts_array_name};

    # Prepare destination directory
    install -dm755 "$pkgdir/usr/share/fonts/TTF"

    # Install fonts
    for font in ${fonts[@]}; do
        install -m644 $font "$pkgdir/usr/share/fonts/TTF"
    done

    # Install license
    install -Dm644 license.rtf "$pkgdir/usr/share/licenses/$pkgname/license.rtf"
}

for package_name in ${pkgname[@]}; do
    eval "function package_$package_name() { _package $package_name; }"
done

md5sums=('1e0acd79a5a6e269a3421dc00d9aa722'
         '38de9acc2d1d8318e464930df1b8ca2d'
         'dec6705e773e544f6f19a150f83d3114'
         '3d6c0be1f2859fe527795c4d7d709d76'
         '1f704893145d21747186116f85b2c062'
         'cfbe2858223b5d6f0fead9583b07f3fd'
         '6548235ee4b7ca0b8a7d464546fa5ca5'
         '1d32338d1c97538b798ca8563f70d39a'
         '8f87bcf26c27af0830c28c30a35bb211'
         '2d1f895adcb5d23e9300d32c1f78104e'
         '391e637d4610de7c1f1e4dcaaa44c74b'
         '8f5e2cc6baf642e7dea9ebe68d129987'
         '4f0fe9bfbbff9647ccc24d00a80ecf16'
         '45a9841a7f5ba7a780f0a804553cfce7'
         'e2ae623d5f37a67aaf66673fc5be6ea7'
         '9f6c62f1f041ca9f3d69ac76684314d0'
         'de6243382a94fdc4813e4cbd4ff7d919'
         'd9e4d24448593640c2cc90e68c3317f6'
         'ca432c56ca6ff81a0a1476846dffeac9'
         '9d82f2cd4cf4ec35d72f70e4e025072b'
         '9d0962f073f288d799831d4688b1e917'
         'ed07815509f9c255b6e0f66c7910eb97'
         'bcccd674c3fe808a4b01b8914c6898d5'
         '5f10daf510c3cb9ccfa737cade9c5a90'
         'a5de9a11d94b2cf305d13a32d1088660'
         '8361c7922287c672493a11c10ffedb32'
         '363ce725d6c62520d087cd583c2f63f4'
         '3ee4f47946aa203f078877fd6f6427c0'
         '3eb766b15f377d0956685ce734063d30'
         'c455d94eee43dc4ceeb83c0c0fd0d4c8'
         '4ed8298204138b08c1e73d2d9a6cba9a'
         '5c452fb7a0f5751f4e94e9d84eb01154'
         'acd33fd0ea8c011932aa4f3ac713663c'
         'f99ea84062835b8d7ac4c68f6acf5b7e'
         '1fcaecda063112df9165fb6ec00882bb'
         '452133c98458128fe74e982078460cab'
         '5d51eba86e9217c97559947f2d01f53b'
         '886dc601b2adb01bbfe8a4facf9d566d'
         'd6a449664f4fcbec971dc5b92ff7801d'
         'ae4f7684dc1c509accc0d295f7487a2b'
         '1770fbba68d5afa129c8243ed92b0c1c'
         '073c54deab691dba98be14fe4fea8278'
         'c5e631d3da2bdf8ce9929ae794843a06'
         '437c3323b83093ccb16abbf197bb4e40'
         '4c8aa8124876afd5474fb94d53785536'
         '9629034e291841f941497d4a365c01f7'
         'a2b250ae6a2bf656d77d908c8fd2bfdc'
         'e04520b1269ce0ab75e2ec2b1fd80782'
         '878a4f7dd749d2484386e1c994ded1da'
         '3c8fa6e342a058359f85fbd7722c6144'
         'b24f0a2dc431774a60aece53a0de1bdb'
         'f617a107c4509b8c44e5747920a52df9'
         '1abd1c73463dca1a3e18006ba34ad4ac'
         '8b3f07fcea987ce38c83246fa6175cd3'
         '4c98e9ed8ddca5e465f3340f833a616e'
         '6d953d3bbe8817cd2b004dc11ac9f1d5'
         'ba34b303291e36596759eb46ad9c51f2'
         'ddbe52e2cfdcc2b8c9c4ab8de872a325'
         '85e38a5e32b54e416c4b437b59501d31'
         'b8d06d04e2d848ebcdd428cd8125f211'
         '40a90d72da61d7c609c9a4c4bb37c710'
         '68c74934563bf4afa50793c67bd19b24'
         'baf2d27a2cc7aea124138fb8b4fb5b4d'
         '8879a4caa29c42ce616cd5f172299366'
         'a2e4c0b388a3013015349a2aee18fe38'
         'a3e6f73440d8535c2c7c43489e942a10'
         '333ce7de4d889233dea963e16f547487'
         '2c03a94cb796eb012908069335c98252'
         '6ede9249499bba99886e63efb89eac37'
         '081c24bfc5625fd86e7aa96d2599d869'
         '7e32ca996d7f588ed65551a37ae145ed'
         '6036be2d769db6a0f1918cb65b48b89c'
         '8daa0f2304ee100fe3888d5b7307e64f'
         '702d8433e65d57e2612d01f1db078242'
         'f4ab481e2d12c0321cc1907192da90f0'
         '44b0a478d3b790698f52828bbf6b2b68'
         '2b96269935d724df38efb541ee391f8f'
         '3ff4f49424db1e955ca167ce06a0dfd2'
         '5409c269bd43ed6daece60eaa546a02c'
         '242915b2e93efd217abef857cc3d3ed1'
         '39d51726a8c8b7eb4bb6fab61d16841a'
         'b411b0999020c9c25b8151e359197150'
         '68948ea9bc8b232cc5664e2aab39c80c'
         '1ad619060822679a34db35a498f98ecc'
         '51ee907427c788c3ab4442e73286d641'
         'c87f06ae40c78321844f2eac8b51737f'
         'e6c0e179deb07f3fc7a6d0d7a2a77247'
         '6c5e3e581b522258be508b4d8868025d'
         'd44e7660a481c4301fef58738e6b0e09'
         'ba372cb7ef918164f520ebb0a693006e'
         'edeaf9e7f4404f7cd577c7628cc56a08'
         '09472561d98bb662466d0fd093e9c1e6'
         'd0126c33d3fea2ecb01cd91b8160129c'
         '7cdc198e3527bf6c5ca330a70278f310'
         '6f8beb62aeae3e7ffd3dbf342f4d4253'
         'af53b53dcea967bd95b045bc5f7aaa86'
         '3d3aa0c809a54d4aee31bd46acaab29a'
         '04848fe193cc29ebb136c62e4e9d86e2'
         '4cdcbaebff67417de67435deb061b789'
         '3c1a440c0da3e6484b92282953ca3555'
         '8d7367b9ce52c725c1f8fb96cc0c8829'
         'd432ed840a9a13992897dde5f803bd17'
         'ca7f7cedd1df47077bfcf74dea2107dd'
         '405b972928c4b2e19d54034f6b02d709'
         'f67ffb5a32e345123b6e22aff1544a47'
         'd4669f57d7ee1cb1641b33692fbbf11a'
         '3cd2bb8a3d1c7fc15eef01f1adc4c071'
         '706d06a0c45362744dfdc2896366bd31'
         'd1fcc5ac64e9b52c6e63f53f59ac8d80'
         '0b5daaee28ed20474e5b2f204add18f0'
         '75e6ef1b533b46479e1390bf8f887603'
         '5a68a4e0bd54f918326fdcf96028e3ff'
         '119688cc24c7a1c78a469b0ed365edd7'
         'c9ebe11cbee5b011666eeffa9a549f6c'
         '1ca7356ca863431f36aff1647a76b918'
         'b01bdacdd24858fac6bbe36c69eb281b'
         'b4ece38d8537d1a15ac9d133353d2631'
         '0a87dbbedf7f74b08ef4474df817603d'
         '95ecc0565801dd1bf141999d2c6a773b'
         '3350b74ee179d80520af3ebee4349ae7'
         'feffee027a2741a805fc4a1fbf8cdeec'
         'dd65023bb564646bd667f15a4ca3615f'
         '41b542e60d48fe9ce55f52cca935cf8f'
         '1ac7418067be30f0bf726abff6487f8c'
         '0723999ddc6b4b922ec011b475f07d9d'
         '8d39983818afbd9cbd8927b037588e5e'
         'f4fde5baf005269c9ab6edb4fc24025a'
         'dbb5d50716af7c45dd357a6a585d7a9e'
         'bbb263a37fb063b359e33887b6a4f438'
         'a4df3d010a6050b0e9cf0fa936a89d29'
         '812829dc374bf32e984a2fc3f45364b3'
         '0f27d0f170856e6bda9eea60f7bca0b0'
         '982509f4c25a0ac0f4e368e222e894fe'
         'fde85c81a1b925fac046e0c916f04847'
         '8da139ade3e81de0bbe8ffe30a8e3099'
         '08f7717ade19b78b48e02744f9b13f2e'
         '9ae66cdfad1a6456c4687b9133c09c3e'
         '5d6668ab1003220bf03185971cc731b0'
         '79e95205706c61bfe684c3a00ba5f870'
         '0c5496ca205ffe62b69da242c6cd1170'
         'bbfaa12767e15e3f94ea902402527b17'
         '5505af031d79715c8663fbed0f7ca7fd'
         'e54ea8e978c319647285100ebcabb037'
         '127efc862e34db7d79b5c9c68ffba19c'
         '2ecbfe1d9bfc191c6f15c0ccc23cbd43'
         '5e42bcb1a2f001debc82305025461bc5'
         '754b8ca1a3bc662247a948adcaa91459'
         '831990523227b528157bb99b63f6b45b'
         '3132d56329d73980d5fd547ea7271a98'
         '5d1a0d45e04ebe0ef8c7a44e1ca46b56'
         '0f833110f12084efc38a3fce20c536b1'
         'a3272cf4d7504b5149a7f1df5701f21a'
         'c3936597ba7b66a50395c34c2f6ddc7e'
         '7de81d401f7296a6bc91ae1a22f61454'
         '28036b73523a9611b5462394b96982d7'
         '922c69f8bc91cc1fbe399bff2763f94a'
         'e6d787ca7e5e22fcd2e96ef16ceab535'
         '95e2fd1b367ddd8a4f096baf3146c481'
         '35010e03d04d3517f4b083bb2741dd56'
         '5f6ed84883c73a8e9b871696553f0735'
         '5a7e248e9904665bff2ed61eabfda95e'
         'f1c7dba4cfe491c65ac2c224211dea88'
         '49b8a04d266f07aeee9502844866bbea'
         '80d3c02fdfa4e1addaeabbddb2998e3f'
         '97a691acff5583b5bf9898e912facf1a'
         '3ea7a1100614e84e44139e2c689373d0'
         '1f00634e4b14e1c850f7a6cedc9abfc9'
         '97234c3d16113891ca7d34225854a4c4'
         '0657a2cb45e432a9240e934c88a5b048'
         'a67fb83da88e5bc3948c66298657fdb5'
         '334188a2bfdcbed1732f1f5d3f9926aa'
         '3b98517806f22c685f5aeeda21c424da'
         '3caa929ecdb555261d42cedd40b7cca7'
         '2a6ccae36b0e1df8ce2feb25549b14e6'
         '0e49d01dfa7eb7c78aad0dd50fc42ade'
         'afa8ac9764369f076613bdc560adb1a1'
         'bb967b84010cc6f6bd067ca24d2e0f61'
         'c9d9dc80a14553d1537a810aa9274b1b'
         'bdab91abf0d4de49395f357333bf4d3f'
         '4dcefb243cda43847e8af38ec0d5713e'
         '39445d1352b1a73d5ce935066138e7c3'
         'eb50dd97aad245ccad2b898483bf9268'
         'de58a36b91c830a97897dc4cb00c9e7e'
         '4e24c34cfe38c779c97dc5c88bdd5d4e'
         'c9106b754d1358c2eef862963b35e4e7'
         'c2f87ead12c0420d19fd944d4a409787'
         '70a3e6d215adcfd3aaa722b732e84ca0'
         '170585fb55659d5577932b9e2877431b'
         '8687738851acc1c4cd0e2317c0cf8069'
         'aec55e3620952c7381d7cd462c52257b'
         'cc6c99b66a5b4c4e82ff2c6ed95077b4'
         '3cb74fe6198ee7b4e4f675aacf265618'
         'b50ef16c35ec7487935d84bde8c770d1'
         '5e9f0667fb361414006555937ea5e053'
         '070f54e1790ee0a495de46729b974b57'
         '764f1693a1b650f28a9de87e4bf26c5f'
         'fc8825bd36bbc597d3dfe69f43fa1d0a'
         '8b278d0dde318c103f0a6e48e28cf979'
         'bd62018c47c6141847cd00dcf20a215e'
         '2e571e571f0815b5e0488d05b3b0bd15'
         '0028965ad4f00a50fb734256f882f8c2'
         '16524d39509891d28a9c54ff90015ca8'
         'dd4c3fdecbe653539dcff65e3359d837'
         'ec2fd5c5e8ee0f866a5db50f7184e3f0'
         '91e8bd036d529a8c5cab178dab22f561'
         'cd3ee79a96eb48acedc65a5f00c3f1c2'
         '1059ad38e2a3bd334504686a2901eedb'
         '89472d248b96ed4271ee74c7e6cdbe9d'
         '7a6cd3b905e2cf67ec81a58d1284ee17'
         '3239d4ce37dc032f69b9d20ce4d1b094'
         '4659d2f8c0a7b29bbb90a3dd48027fc7'
         'bb6a3523f05c7657e9d4f579b91c5925'
         '5ac608dd341653cec6ed7eb33d6522ec'
         '67a5931beaa0bf6f56505317dcedb218'
         'd377b9809c76e4c23fd1220ec6b53d68'
         '45c0a614c6a6cd1533a79483d0b4654d'
         'e1beec2f30e6fc4e89a9c58ca9a9de73'
         '068e54316b6e7ba1d1bfd973c7d3b059'
         'ae32da51cb4715541b6a9f2a5e3939f0'
         '0ca38fd8b36f42551016799eb262823b'
         '2e6f2270914cff35e0c7aef5f6ebd82c'
         '11ce603207f2546af540c4d1c27d287e'
         'ddca0eac084a0d438fc60aa310b66b31'
         '2dd7f1672fd7f3b4608baa334ab9059c'
         'dc29157237cb5e7f6fac4c58029953d5'
         'b89c8729b39065ee275beedc13fe7a4b'
         '9d89303c895428cf4a585d0a937f033e'
         '6175f89f7539b7a68ea9528fe48c2370'
         '2fec0470dcaac02b4cd2ebc6a694acf1'
         'fed576f140815b94c793e22c991c2502'
         'f3b22ecbd734443a5c99b9908eeaeb7e'
         '85eb84d8b56261f6f4ca511f3b99f0a7'
         'b919b4e8df73ef06e6cdfc49ed20e288'
         'fc64a78f4c7513930767797622924d3c'
         'c0bfb17b52723f06f5e5be61b3031dd9'
         'dc6ce921588efbff7c3230c500e41564'
         '31ab347314e501b747387a28e61e1d3c'
         '9b17af8c8e352ab66c5772c171871c28'
         '63921fe40d60c5bd6eff14f10065bc18'
         'b09b497925ae99f5b58fb854e1056f5b'
         'ac39fdef0e9d11d8eec9644491d67e95'
         'c404020f4ee57d612f51c6514527f456'
         'aa1670c15c9ee445c6b27973de080f08'
         'e8db0680922a406aed2a21c0576f295d'
         '5519f156b480e952712b20991317ecf1'
         '0c9ea7edae52522a3db685416dc0dd34'
         '0bbc39244ed40871e67541d9f7f35569'
         'b9423634d027b085c84cee26e13db70a'
         'abc0bef3fdd877abe64aa81d035548a8'
         '428896fa5b8ccceced61f4092a19bed9'
         '9a75b65bbb8757301cf5bf5a54c8df2a'
         'a580c429ba5130a697350dbb5fe64927'
         'e82263c736c3fb0631639571c34663ca'
         'c70dcf29d5da576587eee25911f06321')
