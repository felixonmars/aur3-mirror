# Contributor: Ben R. <thebenj88 *AT* gmail *DOT* com>

pkgname=swordandsworcery-hib
pkgver=1.02
pkgrel=1
pkgdesc='A unique take on the sidescrolling adventure genre, with puzzles, combat and more (Humble Bundle version)'
url='http://www.swordandsworcery.com'
arch=('i686' 'x86_64')
license=('custom:commercial' 'LGPL3')
depends=('libgl' 'mesa')
optdepends=('catalyst: AMD Proprietary 3D driver'
			'nvidia: NVIDIA Proprietary 3D driver')
PKGEXT='.pkg.tar'

_gamepkg="swordandsworcery_${pkgver}.tar.gz"

package() {
	# Get installer
  _get_humblebundle_source "${_gamepkg}" || {
    error "Unable to find the game archive. Please download it from your Humble
           Bundle page, and place it into one of the above locations."
    exit 1;
}
    bsdtar -xf ${srcdir}/${_gamepkg} 
    
    #Create directories
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/opt/${pkgname}/{bin,lib,res}
	mkdir -p ${pkgdir}/usr/share/{licenses,doc}/${pkgname}
	
	#Install license and documentation
	install -Dm644 ${srcdir}/eula.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dm644 ${srcdir}/README.html ${pkgdir}/usr/share/doc/${pkgname}/README.html
	
	#Install game contents
	install -Dm755 ${srcdir}/run.sh ${pkgdir}/opt/${pkgname}/swordandsworcery.sh
	install -Dm755 ${srcdir}/bin/swordandsworcery ${pkgdir}/opt/${pkgname}/bin/swordandsworcery
	install -Dm644 ${srcdir}/res/sworcery.dat ${pkgdir}/opt/${pkgname}/res/sworcery.dat
	install -Dm644 ${srcdir}/res/sworcery.dat.cat ${pkgdir}/opt/${pkgname}/res/sworcery.dat.cat
	mv -v ${srcdir}/res/sounds/ ${pkgdir}/opt/${pkgname}/res/sounds
	chmod -R 644 ${pkgdir}/opt/${pkgname}/res/sounds
	
	mv -v ${srcdir}/lib ${pkgdir}/opt/${pkgname}
	chmod -R 644 ${pkgdir}/opt/${pkgname}/lib
	
	ln -s ${pkgdir}/opt/${pkgname}/swordandsworcery.sh ${pkgdir}/usr/bin/swordandsworcery

}
	
	
	
	
  
# Thanks again to smls for the following two functions, these saved me
# a lot of time.

# Locate a game archive from one of the Humble Bundles, and symlink it into $srcdir
_get_humblebundle_source() {
  _get_local_source "$1" || return 1;
}

# Locate a file or folder provided by the user, and symlink it into $srcdir
_get_local_source() {
  msg "Looking for '$1'..."
  declare -A _search=(['build dir']="$startdir"
                      ['$LOCAL_PACKAGE_SOURCES']="$LOCAL_PACKAGE_SOURCES")
  for _key in "${!_search[@]}"; do local _dir="${_search["$_key"]}"
    if [ -z "$_dir" ]; then _dir="<undefined>"; fi
    echo -n "    - in $_key ['$_dir'] ... ";
    if [ -e "$_dir/$1" ]; then
      echo "FOUND"; ln -sfT "$(readlink -f "$_dir/$1")" "$srcdir/$1"; break; fi
    echo "NOT FOUND"
  done
  if [ ! -e "$srcdir/$1" ]; then return 1; fi
}
