pkgbase=openxcom-bundle-git
pkgname=( 'openxcom-bundle-git' 'openxcom-bundle-data' 'openxcom-bundle-mods' )

conflicts=("openxcom" "openxcom-git")

_gitname=OpenXcom
pkgver=1.0_1037_g894263b
pkgrel=2
arch=('i686' 'x86_64')
url="http://openxcom.org/"
license=('GPL3')
makedepends=('git' 'xmlto' 'docbook-xml' 'docbook-xsl' 'doxygen' 'sdl_mixer' 'sdl_gfx'
             'sdl_image' 'sdl' 'yaml-cpp51' 'libgl' 'gcc-libs' 'glibc' 'boost' 'glu' 'aria2')

_inc_mods="High-quality soundtrack, Terrain Pack, Improved Hand Objects, Final Mod Pack, YetMoreUFOs, Old DOS sounds, Alternate High Quality sounds"

source=( git+"https://github.com/SupSuper/${_gitname}.git"
    "http://openxcom.org/download/extras/universal-patch.zip"
    "openxcom.sh"
    
    # http://users.atw.hu/xcom-sounds/
    "http://users.atw.hu/xcom-sounds3/MT32-rev2.zip"
    
    # http://openxcom.org/forum/index.php/topic,2358.0.html
    "Terrain_Pack.zip::http://www.openxcom.com/content/files/Dfp2BV9V/TERRAIN%20PACK%20v3.7.zip"
    
    # http://www.openxcom.com/mod/improved-hand-objects
    "http://www.openxcom.com/content/files/3e38b3f0/ImprovedHandObsPack.zip"
    
    # http://www.openxcom.com/mod/final-mod-pack
    "FinalModPack.zip::http://www.openxcom.com/content/files/LzeZTDAM/FinalModPack_1.5.2.zip"
    
     # http://http://www.openxcom.com/mod/yet-more-ufos
    "YetMoreUFOs.zip::http://www.openxcom.com/content/files/f0d6b867/YetMoreUFOs_0.6.zip"
    
    # http://openxcom.org/forum/index.php/topic,2044.0.html (old DOS sounds)
    "Old_DOS_10_12_Sounds.zip::http://openxcom.org/forum/index.php?action=dlattach;topic=2044.0;attach=7200"
    
    # http://www.openxcom.com/mod/moriarty-039-s-power-armor-redux
    #"http://www.openxcom.com/content/files/550bf8d1/MoriartyArmor.zip"

    # http://openxcom.org/forum/index.php/topic,2675.0.html
    #"XComArmoury_v1.03a.zip::http://openxcom.org/forum/index.php?action=dlattach;topic=2675.0;attach=12085" 
    #"XComArmoury_XAEResources_v1.03a.zip::http://openxcom.org/forum/index.php?action=dlattach;topic=2675.0;attach=12086"
    #"XComArmoury_XAE_Utility_v1.03a.zip::http://openxcom.org/forum/index.php?action=dlattach;topic=2675.0;attach=12087"
    
    # http://www.openxcom.com/mod/high-quality-sounds
    "http://www.openxcom.com/content/files/5de8f202/HQSounds.zip"
    
    # http://www.openxcom.com/mod/ryskeliinis-guns-n-gadgets-1st-pack
    #"Ryskeliini_GunsNGadgets.zip::http://www.openxcom.com/content/files/e9602829/Ryskeliini_GunsNGadgets_1st_pack_v12.zip" 
    
    #http://www.openxcom.com/mod/retaliator
    #"http://www.openxcom.com/content/files/MFjdvdjS/Retaliator.zip"
    
    
)

noextract=( universal-patch.zip FinalModPack.zip MT32-rev2.zip Terrain_Pack.zip ImprovedHandObsPack.zip YetMoreUFOs.zip Old_DOS_10_12_Sounds.zip  HQSounds.zip  )

sha256sums=('SKIP'
	    '5c1cb39af165cd9294991bb573197db87c5d1818d75655fd7a1b6bd525a7ed57'
	    '08e8fa50a1c60935047cc6f20a53dbf7f8d3249c754b814e88763c5bb65ed147'
	    '371396e379202803f62b3ccf815d92880911a741c57f92de4f526b7355db4a0d'
	    '4991271cfdeb5bdc3b959b76573ecf878518c3e35d379302f41b8e5206351fda'
	    '1222c5583e1e14c5e61fb1dfde8f29cd08d7b54b415778dfc2e23d11e78ca446'
	    'b7db3fc6e63ec2bd312f7cb9fad63f21adea904ab56bb7769cb10a38c3f6014d'
	    '8e56e0db031a314442110686125a80af41f4bcc9aa4430720da9f0bba200ba1c'
	    '4704ba4a9cf1f8296738fd2c993b59e945b412dfdda11a355ce009d6b5311f30'
            '3f2cc112c266e1a8770b876227c42038e4bb748744162dcc1ff4e44bf6ce502a')

_xcom_torrent="magnet:?xt=urn:btih:29326c8baa909e95ae97771c1521571549615e1d&dn=XCOM+Ufo+Defense+%281994%29&tr=udp%3A%2F%2Fopen.demonii.com%3A1337&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A6969&tr=udp%3A%2F%2Ftracker.leechers-paradise.org%3A6969&tr=udp%3A%2F%2Fexodus.desync.com%3A6969"

pkgver() {
  cd $_gitname
  git describe --tags | sed -e 's:v::' -e 's:-:_:g'
}

prepare_openxcom-bundle-data() {
  pushd $startdir >/dev/null
  if [[ -d "XCom UFO Defense" ]]; then
    echo "It looks like XCOM data has already been downloaded."
  else
    echo "Downloading original XCOM through bittorrent."
    echo "Abort if you do not want to do this."
    aria2c --seed-time 0 $_xcom_torrent
  fi
  popd >/dev/null
}
prepare_openxcom-git(){
  cd $_gitname
  ./autogen.sh
}

prepare() {
  prepare_openxcom-bundle-data
  prepare_openxcom-git
}

_data=/usr/share/openxcom/UFO
_mods=/usr/share/openxcom/standard

_xcom_data_pkg() {

  pushd "$startdir/XCom UFO Defense/XCOM/" >/dev/null
  cp -R --parents GEODATA GEOGRAPH MAPS ROUTES SOUND TERRAIN UFOGRAPH UFOINTRO UNITS $pkgdir${_data}
  popd >/dev/null
  pushd $srcdir >/dev/null
  unzip -n universal-patch.zip -d universal_patch
  pushd universal_patch >/dev/null
  cp -R --parents MAPS ROUTES TERRAIN UFOGRAPH UNITS $pkgdir${_data}
  popd
}

_unzip_extract_mod() {
  pushd $srcdir >/dev/null
  unzip -n $1 -d "${1%.*}"
  echo "packaging mod ${1%.*}"
  #echo cp -Rv "${1%.*}/${2}"/${3} "${pkgdir}/${_mods}/${4}"
  
  mkdir -p "${pkgdir}/${_mods}/${4}"
  
  cp -R "${1%.*}/${2}"/$3 "${pkgdir}/${_mods}/${4}"
  popd >/dev/null
}

package_openxcom-bundle-data() {
  pkgdesc="Game data for OpenXcom. Downloaded via bittorrent."
  arch=('i686' 'x86_64')
  mkdir -p $pkgdir${_data}
  _xcom_data_pkg
}

_install_mods() {
  _dst="$pkgdir/${_mods}/"
  mkdir -p $_dst

  _unzip_extract_mod MT32-rev2.zip ./ "*.ogg" "Music-MT32/SOUND/"

  _unzip_extract_mod Terrain_Pack.zip 'TERRAIN PACK v3.7/' '*' "Terrain_Pack/"

  _unzip_extract_mod ImprovedHandObsPack.zip ./ "*" "ImprovedHandObsPack/Resources/"
  pushd $pkgdir/$_mods
  mkdir -p  ImprovedHandObsPack/Resources/Ruleset
  mv  ImprovedHandObsPack/Resources/*.rul ImprovedHandObsPack/Resources/Ruleset
  popd

  _unzip_extract_mod Old_DOS_10_12_Sounds.zip ./ "data/*" "Old_DOS_Sounds/"

  #_unzip_extract_mod YetMoreUFOs.zip ./ "*" "YetMoreUFOs/"

  #_unzip_extract_mod XComArmoury_v1.03a.zip ./ "*" "XComArmoury/"
  #_unzip_extract_mod XComArmoury_XAEResources_v1.03a.zip ./ "*" "XComArmoury_XAEResources/"
  #_unzip_extract_mod XComArmoury_XAE_Utility_v1.03a.zip ./ "*" "XComArmoury_XAE_Utility/"
  
  _unzip_extract_mod FinalModPack.zip ./ "*" ./
  
}


package_openxcom-bundle-mods() {
  pkgdesc="Some mods for the open-source reimplementation of the famous X-COM game. Includes: ${_inc_mods}."
  arch=('i686' 'x86_64')
  _install_mods
}


package_openxcom-bundle-git() {
  pkgdesc="An open-source reimplementation of the famous X-COM game (git-version)"
  depends=('sdl_mixer' 'sdl_gfx' 'sdl_image' 'sdl' 'yaml-cpp' 'libgl' 'gcc-libs' 'glibc')

  cd $srcdir/$_gitname

  # disable subdirs -- we install docs separately

  ./configure --prefix=/usr --bindir=/usr/share/openxcom --disable-werror YAML_LIBS="-L/opt/yaml-cpp51/lib -lyaml-cpp" YAML_CFLAGS="-I/opt/yaml-cpp51/include"
  make
  
  sed -i 's:^SUBDIRS = docs$::' Makefile

  mkdir -p $pkgdir${_data}
  
  make DESTDIR="$pkgdir" install


  #install wrapper (needed for yaml-cpp 5.1)
  install -Dm755 "$srcdir/openxcom.sh" "$pkgdir/usr/bin/openxcom"
}
