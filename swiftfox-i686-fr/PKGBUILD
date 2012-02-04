# Contributor: tuxspirit <tuxspiritATarchlinuxDOTfr>

pkgname=swiftfox-i686-fr
_pkgname=swiftfox
_pkglang=fr
_xulver=1.9.2.13
_ffver=3.6
_pkgarch=i686
pkgver=3.6.13
pkgrel=1
pkgdesc="Mozilla Firefox optimized build for OLD AMD and INTEL processors on x86 architecture (French version)"
arch=('i686')
url="http://www.getswiftfox.com"
license=('custom')
provides=('firefox' 'swiftfox')
depends=( 'desktop-file-utils' 'xulrunner>=${_xulver}' 'nss' 'mozilla-common' 'libxt')
makedepends=('unzip')
conflicts=('swiftfox' 'swiftfox3' 'swiftfox-prescott' 'swiftfox-i686' )
source=(http://www.getswiftfox.com/builds/releases/$pkgver/$_pkgname-$pkgver-$_pkgarch.tar.bz2
        http://www.getswiftfox.com/LICENSE
        swiftfox.desktop
        swiftfox.png
        ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${_ffver}/linux-i686/xpi/${_pkglang}.xpi)

md5sums=('8623d64ce119047ffb5a9a149b245426'
         '7d2764ff8d5c9b0ba5be6028a3459e1d'
         '7b2bc5553bb2beaa8d49b4745bbc0c02'
         '92cb01c531a7ada40ca063b58d597de2'
         '658183e3e94959582c3bd382644692ea')


build() {

  #Software    	
  cd ${srcdir}/ || return 1

  mkdir -p ${pkgdir}/opt/ || return 1  
  cp -r ${_pkgname} ${pkgdir}/opt/${_pkgname} || return 1
  
  ##Fix error install.rdf
  chmod -R 755 ${pkgdir}/opt/${_pkgname}/extensions/* || return 1

  mkdir -p ${pkgdir}/usr/bin || return 1
  ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname} || return 1

  install -d -m755 ${pkgdir}/usr/share/{applications,pixmaps,licences} || return 1
  install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname} || return 1
  install -m644 -D ${srcdir}/swiftfox.png ${pkgdir}/usr/share/pixmaps || return 1
  install -m644 ${srcdir}/swiftfox.desktop ${pkgdir}/usr/share/applications || return 1
  install -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname} || return 1

  #Translate
  unzip -o ${_pkglang}.xpi 
  sed -i "s|jar:chrome/${_pkglang}.jar|jar:${_pkglang}.jar|" chrome.manifest || return 1 
  install -D -m 644 chrome/${_pkglang}.jar ${pkgdir}/opt/${_pkgname}/chrome/${_pkglang}.jar || return 1 
  install -D -m 644 chrome.manifest ${pkgdir}/opt/${_pkgname}/chrome/${_pkglang}.manifest || return 1 
  rm ${pkgdir}/opt/${_pkgname}/chrome/en-US.jar 
  rm ${pkgdir}/opt/${_pkgname}/chrome/en-US.manifest
  sed -i "s|en-US|${_pkglang}|" ${pkgdir}/opt/${_pkgname}/defaults/pref/firefox-l10n.js || return 1
}
