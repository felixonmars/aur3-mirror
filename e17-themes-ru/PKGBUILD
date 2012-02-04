# Maintainer: Nixtrian (nixtrian@gmail.com)
### This build is e17-themes mod with replacing Vera font with DevaVuSans (it is necesary for Russian utf8 locale)

pkgname=e17-themes-ru
pkgver=20090727
pkgrel=1
pkgdesc="Themes for E17 desklock from exchange.enlightenment.org with Russian language support"
url=(http://exchange.enlightenment.org/theme/index/theme_group_id/2634/)
license=('GPL' 'BSD' 'CCPL' 'Unknown')
arch=('i686' 'x86_64')
depends=('e' 'ttf-dejavu')
source=(http://detour.googlecode.com/files/detour-0.7.4_e17.edj)
md5sums=()
conflicts=('e17-themes')

# Base URL for the themes.
_themesbase="http://exchange.enlightenment.org/theme/get"

# Array of "id:name" values,
# where id is the theme id at http://exchange.enlightenment.org/.
# Use '_' instead of ' ' in names;
# they will be replaced when printed to stdout.

_themes=(
394:Apple17
2084:Bling
404:Bloody_Imago
1114:Blue_Eyed
1044:Camou
294:Cerium
4:Chrome
604:ClearLooks
1034:Crude
274:Cthulhain
1074:Dali
444:Darkness
1064:Dark_Revolution
1104:DarkSide
934:Dukes
174:Edjy
164:Edjy_Black
204:Fireball
624:Gant
154:Grunge
184:Iceball
374:Imago
384:Imago_Colored
1594:Milky
1054:Night_Bling
2094:Pink_Apple
304:Simply_White
584:Smoke
884:Steampunk
614:Winter
2154:Post_It_White
2164:PCE17OS
534:Japan_2007
2234:Detour_Glossy_Red
2333:Blue_Grass
2353:Simply_White_etk
)

build() {
cd "${srcdir}"

# Get the themes
for _theme in ${_themes[@]}
do
# Separate name and theme id.
_name=${_theme#*:} # Remove theme "id:"
_name=${_theme//_/ } # Replace '_' by ' '
_id=${_theme%%:*} # Remove theme ":name"

echo
echo
echo "----------------------------------------------------------------"
echo "*** Downloading theme '${_name}'..."
echo

wget -N -c "${_themesbase}/${_id}" ||
echo 2>&1 "### Error downloading theme '${_name}'."
done

rm -rf rus
mkdir rus
cd rus

 msg "Decompiling modules..."
 for i in ../*.edj; do
 msg $i
 edje_decc $i 
 done
 
 msg "Replacing Vera font"
 find -name Vera.ttf -exec cp -f /usr/share/fonts/TTF/DejaVuSans.ttf {} \;
 find -name VeraBd.ttf -exec cp -f /usr/share/fonts/TTF/DejaVuSans-Bold.ttf {} \;
 find -name VeraIt.ttf -exec cp -f /usr/share/fonts/TTF/DejaVuSans-Oblique.ttf {} \;
 find -name VeraMono.ttf -exec cp -f /usr/share/fonts/TTF/DejaVuSansMono.ttf {} \;
 find -name VeraMoBd.ttf -exec cp -f /usr/share/fonts/TTF/DejaVuSansMono-Bold.ttf {} \;
 find -name VeraBI.ttf -exec cp -f /usr/share/fonts/TTF/DejaVuSans-BoldOblique.ttf {} \;
 
 
 msg "Rebuilding modules..."
 for i in *; do
  if [ -d $i ]; then
  cd $i 
  msg "$i"
  [[ "$i" == "blue_eyed_0.6.5.g_ma" ]] && mv -f parts edjes && mv -f programs edjes && mv -f scripts edjes
  [[ "$i" == "dark_revolution" ]] && mv -f pager*.edc modules/
  [[ "$i" == "Dukes" ]] && mv -f menu_* menu/
  [[ "$i" == "detour-glossy-red" ]] && mv -f shelf_*.edc bits
  [[ "$i" == "detour-0.7.4_e17" ]] && cd .. && rm -rf $i && cp -f ${srcdir}/detour-0.7.4_e17.edj ./ && continue
  [[ "$i" == "japan2007" ]] && mv -f button_macro.edc edc/
  [[ "$i" == "winter-e17_0.1" ]] && mv -f button_macro.edc edc/\
  && mv pager_main_parts.edc edc \
  && mv snowflakes.edc edc \
  && mv fileman_default_* edc/ 
  
  ./build.sh || return 1
   mv -f  *.edj ../ && cd ..
  fi
 done

#msg "Prepare package directory structure"
install -m755 -d "${pkgdir}/usr/share/enlightenment/data/themes" || return 1

#msg "Install the edjs"
install -m644 ${srcdir}/rus/*.edj "${pkgdir}/usr/share/enlightenment/data/themes" || return 1
}
