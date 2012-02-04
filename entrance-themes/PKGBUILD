# Contributor: Nicky726 (nicky726 <at> gmail <dot> com)
pkgname=entrance-themes
pkgver=20090121
pkgrel=1
pkgdesc="Themes for entrace from exchange.enlightenment.org"
url=(http://exchange.enlightenment.org/theme/index/theme_group_id/4944/)
license=('Unknown')
arch=('i686' 'x86_64')
depends=('entrance')
source=()
md5sums=()

# Base URL for the themes.
_themesbase="http://exchange.enlightenment.org/theme/get"

# Array of "id:name" values,
# where id is the theme id at http://exchange.enlightenment.org/.
# Use '_' instead of ' ' in names;
# they will be replaced when printed to stdout.

_themes=(
1204:Blu3s
1214:Clean_Entrance
564:Darkness
214:Fireball
414:Imago
1244:RedB
1574:Steampunk
1234:Uberpinguin
1224:Watchwolf
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

  # Prepare package directory structure
  install -m755 -d "${pkgdir}/usr/share/entrance/themes"

  # Install the edjs
  install -m644 ${srcdir}/*.edj "${pkgdir}/usr/share/entrance/themes"
}
