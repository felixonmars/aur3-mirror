# Maintainer: Sam S. <smls75@gmail.com>

pkgname=nightskyhd-hib
pkgver=1
_hibver=1324519044
pkgrel=0
pkgdesc='Part action and part physics puzzler, NightSky tests your reflexes and logical thinking. (Humble Bundle version)'
url='http://www.nicalis.com/nightsky/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('libxi' 'openal' 'freealut' 'mesa' 'mesa-libgl' 'gcc-libs' 'glibc' 
         'libxext' 'libxdamage' 'libxfixes' 'libx11' 'libxcb' 'libxxf86vm'
         'libdrm' 'libxau' 'libxdmcp' 'libogg' 'glu' 'freeglut' 'libvorbis'
         'zlib' 'freealut')
source=('nightskyhd-hib.desktop'
        'nightskyhd-hib.sh')
md5sums=('d806eb79768e11db7db626ef79c614e6'
         '3d2f5ba0b641cd5af512d8bebdb15406')
options=('!strip' '!upx')
PKGEXT='.pkg.tar'

_installer="nightskyhd-linux-${_hibver}.tar.gz"
_installer_md5='73a937ffb5dfd5fc9ba95efacba0a25f'


package() {
  cd $srcdir

  # Get installer
  _get_local_source "${_installer}" --md5 "${_installer_md5}" || {
    error "Unable to find the game archive. Please download it from your Humble
           Bundle page, and place it into one of the above locations."
    exit 1; }
  # make destination
  install -d "${pkgdir}/opt"
  # Extract the file
  tar xf "${_installer}" -C "${pkgdir}/opt/"
  # Remove bundled libraries & helper binaries (use system packages instead)
  rm -rf "${pkgdir}/opt/NightSky/lib" "${pkgdir}/opt/NightSky/lib64"

  # Fix permissions
  find "${pkgdir}" -type f -exec chmod 644 "{}" +

  # Install desktop entry
  install -Dm644 "${pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -Dm644 "${pkgdir}/opt/NightSky/Images/NightSky.png" \
                 "${pkgdir}/usr/share/pixmaps/NightSky.png"

  # Install launcher 
  install -Dm755 "${srcdir}/${pkgname}.sh" \
                 "${pkgdir}/usr/bin/NightSkyHD"
  # install symlink for launcher
  case $CARCH in i686) _arch='';; x86_64) _arch=_64;; esac
  chmod 755 "${pkgdir}/opt/NightSky/NightSkyHD${_arch}"
  ln -s "/opt/NightSky/NightSkyHD${_arch}" "${pkgdir}/opt/NightSky/NightSky"

  # Install license file 
  # -- NOT FOUND IN TARBALL!
  # install -Dm644 "temp/config/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


###### HELPER FUNCTIONS ######

# Locates a file or folder provided by the user, and symlinks it into $srcdir
_get_local_source() {
  msg "Looking for '$1'..."; rm -f "$srcdir/$1"
  declare -A _search=(['build dir']="$startdir"
                      ['$LOCAL_PACKAGE_SOURCES']="$LOCAL_PACKAGE_SOURCES")
  for _key in "${!_search[@]}"; do local _dir="${_search["$_key"]}"
    echo -n "    - in $_key [${_dir:-<undefined>}] ... ";
    if [[ -z "$_dir" || ! -e "$_dir/$1" ]]; then
      echo "NOT FOUND"
    elif [ "$(${2#--}sum "$_dir/$1"|awk '{print $1}')" != "$3" ]; then
      echo "CHECKSUM FAILED";
    else
      echo "FOUND"; ln -sfT "$(readlink -f "$_dir/$1")" "$srcdir/$1"; break; fi
  done
  if [ ! -e "$srcdir/$1" ]; then return 1; fi
}
