# Contributor: tuxspirit <tuxspiritATarchlinuxDOTfr>

_pkgname=swiftweasel
_pkgproc=intel-pgo
_pkglang=fr
pkgname=swiftweasel-intel-pgo-fr
_pkgarch=x86-arch
pkgver=3.5.6
pkgrel=1
pkgdesc="Mozilla Firefox optimized build for INTEL processors on x86 architecture (French version)."
arch=('i686')
url="http://swiftweasel.tuxfamily.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('mozilla-common' 'desktop-file-utils' 'xulrunner>=1.9.1.5' 'nspr' 'libgnome' 'libxt' )
makedepends=('unzip')
provides=('firefox' 'swiftweasel')
replaces=('swiftweasel-nocona-fr' 'swiftweasel-pentium-m-fr' 'swiftweasel-pentium-2-fr' 'swiftweasel-pentium-3-fr'
          'swiftweasel-pentium-3m-fr' 'swiftweasel-pentium-4-fr' 'swiftwesel-pentium-4m-fr' 'swiftweasel-prescott-fr')
conflicts=('swiftweasel' 'swiftweasel3' 'swiftweasel-amd' 'swiftweasel-intel')	  
source=(http://download.tuxfamily.org/${_pkgname}/${_pkgname}-35/${pkgver}-tar.gz/${_pkgname}-${pkgver}_${_pkgproc}_${_pkgarch}.tar.gz
	swiftweasel.desktop
	swiftweasel-safe.desktop
	ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/linux-i686/xpi/${_pkglang}.xpi)

md5sums=('a56ce9d7ff459ae2996e1dd8f97651da'
         'e02fc1051ff31e05e45ec99eb38e16f6'
         'eef46b6617fb0dab69037c122793c6fb'
         'e3606f529881c4e2589102404e9a2270')
	   
build() {

  # Software
  cd ${srcdir}/

  mkdir ${pkgdir}/opt/
  cp -r ${_pkgname} ${pkgdir}/opt/${_pkgname}

  ## Fix error install.rdf
  chmod -R 755 ${pkgdir}/opt/${_pkgname}/extensions/*

  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

  install -d -m755 ${pkgdir}/usr/share/{applications,pixmaps}
  install -m644 -D ${srcdir}/swiftweasel/icons/mozicon128.png ${pkgdir}/usr/share/pixmaps/swiftweasel.png || return 1
  install -m644 ${srcdir}/swiftweasel.desktop ${pkgdir}/usr/share/applications/ || return 1
  install -m644 ${srcdir}/swiftweasel-safe.desktop ${pkgdir}/usr/share/applications/ || return 1 

  # Translate
  unzip -o ${_pkglang}.xpi
  sed -i "s|jar:chrome/${_pkglang}.jar|jar:${_pkglang}.jar|" chrome.manifest || return 1
  install -D -m 644 chrome/${_pkglang}.jar ${pkgdir}/opt/${_pkgname}/chrome/${_pkglang}.jar || return 1
  install -D -m 644 chrome.manifest ${pkgdir}/opt/${_pkgname}/chrome/${_pkglang}.manifest || return 1
  rm ${pkgdir}/opt/${_pkgname}/chrome/en-US.jar
  rm ${pkgdir}/opt/${_pkgname}/chrome/en-US.manifest
  sed -i "s|en-US|${_pkglang}|" ${pkgdir}/opt/swiftweasel/defaults/pref/firefox-l10n.js || return 1
}
