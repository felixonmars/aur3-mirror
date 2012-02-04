# Maintainer: Tommy Alsemgeest <talsemgeest@gmail.com>

pkgname=machinarium-hib
_pkgname=Machinarium
_filename=machinarium
_gamepkg="Machinarium_full_en.tar.gz"
pkgver=3
pkgrel=3
pkgdesc="A point-and-click logic adventure game by the creators of Samarost, \
requires copy of the full game"
arch=('i686' 'x86_64')
url="http://machinarium.net/"
license=('custom')
depends=('hicolor-icon-theme' 'gtk2' 'libxft' 'nss')
if [[ "${CARCH}" == "x86_64" ]]; then
  depends=('hicolor-icon-theme' 'lib32-gtk2' 'lib32-libxt' 'lib32-nss' 
           'lib32-libxdamage' 'lib32-curl' 'lib32-alsa-lib')
fi
install="machinarium.install"
source=(machinarium.png
        machinarium.desktop
        machinarium.sh
	machinarium-browser.swf)
md5sums=('fb9978e2f24ff2db118a8031b1a218e7'
         '018189ba7b060498cebe7d99270ee49c'
         '98b739776fa1db02e14b93fd70ed32e2'
         '2608f5bcf0e0903d4dc63d8d248f2368')

build () {
   cd "${srcdir}"
   msg "You need a full copy of this game in order to install it"
   msg "Searching for ${_gamepkg} in dir: $(readlink -f `pwd`/..)"
   if [[ -f "../${_gamepkg}" ]]; then
       msg "Found game package, installing..."
       ln -fs "../${_gamepkg}" .
   elif [[ -f "${_gamepkg}" ]]; then
	   msg "Found game package in ${srcdir}, installing..."
   elif [ -n "${_humblebundle2key}" ]; then
	   msg "Game package not found, trying to download..."
	   rm -f index.html\?key\=${_humblebundle2key}*
	   wget http://www.humblebundle.com/?key=${_humblebundle2key}
	   wget $(cat index.html\?key\=${_humblebundle2key} | grep "${_gamepkg}" | cut -d "'" -f 10)
	   mv ${_gamepkg}* ${_gamepkg}
   else
	   msg "Game package not found and download failed."
	   msg "You can add \'export _humblebundle2key\=\<Your key here\>\' to \.bashrc if you want automated download ability."
       error "Please type absolute path to ${_gamepkg} (/home/joe):"
       read pkgpath
       if [[ -f "${pkgpath}/${_gamepkg}" ]]; then
           msg "Found game package, installing..."
		   ln -fs "${pkgpath}/${_gamepkg}" .
	   else
	       error "Unable to find game package."
	       return 1
       fi
   fi

    tar xvf ${srcdir}/${_gamepkg} || return 1

  # create pkgdir folders
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/{applications,games,icons}

  # install files
  cp -r ${_pkgname} ${pkgdir}/usr/share/games/${_filename}
  find ${pkgdir}/usr/share/games/${_filename}/ -type d -exec chmod 0755 {} \;
  find ${pkgdir}/usr/share/games/${_filename}/ -type f -exec chmod 0644 {} \;
  chmod 0755 ${pkgdir}/usr/share/games/${_filename}/${_pkgname}

  # license
  # I can't find a license for this game anywhere, not even in there game :(
  #install -d ${pkgdir}/usr/share/licenses/${_filename}

  # launch script
  install -m755 ${srcdir}/machinarium.sh ${pkgdir}/usr/bin/${_filename}
  # browser version
	install -m644 $srcdir/machinarium-browser.swf ${pkgdir}/usr/share/games/${_filename}

  # icon/.desktop
  install -Dm644 ${_filename}.png ${pkgdir}/usr/share/icons/
  install -Dm644 ${_filename}.desktop ${pkgdir}/usr/share/applications/
}
