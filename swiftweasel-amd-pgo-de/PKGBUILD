# Contributor: agihr <andi.gihr@googlemail.com>

pkgname=swiftweasel-amd-pgo-de
_pkgname=swiftweasel
pkgver=3.5.1
pkgrel=1
_pkglang=de
pkgdesc="Mozilla Firefox optimized build for Amd 64-bit processors (German version)."
arch=('x86_64')
url="http://swiftweasel.tuxfamily.org/"
license=('MPL' 'GPL' 'LGPL')
depends=(nss mozilla-common desktop-file-utils libidl2 libxcomposite xulrunner nspr)
conflicts=('swiftweasel-nocona-64' 'swiftweasel-prescott' 'swiftweasel-athlon-xp'
           'swiftweasel-pentium-4' 'swiftweasel-pentium-4m' 'swiftweasel-pentium-m'
           'swiftweasel-pentium-3')
provides=('firefox')
source=(http://dfn.dl.sourceforge.net/sourceforge/swiftweasel/swiftweasel-3.5.1_amd-pgo_x86_64-arch.tar.gz
        swiftweasel.desktop
        swiftweasel-safe.desktop
        ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/linux-i686/xpi/${_pkglang}.xpi)
md5sums=('c22ab7b3c1e8b2bceea7342c4b7c5289'
         'e02fc1051ff31e05e45ec99eb38e16f6'
         'eef46b6617fb0dab69037c122793c6fb'
         '9ebd04319f27967d49de3b9cd10fd4b7')


build() {
  cd $srcdir
#  mkdir $pkgdir/opt
  install -dm755 $pkgdir/opt
  cp -r $_pkgname $pkgdir/opt/$_pkgname
#  mkdir -p $pkgdir/usr/bin
  install -dm755 $pkgdir/usr/bin
 
  ## Fix error install.rdf
  chmod -R 755 $pkgdir/opt/$_pkgname/extensions/*

  ln -s /opt/$_pkgname/$_pkgname $pkgdir/usr/bin/$_pkgname
 
#  mkdir -p $pkgdir/usr/share/applications
  install -dm755 $pkgdir/usr/share/applications
#  mkdir -p $pkgdir/usr/share/pixmaps
  install -dm755 $pkgdir/usr/share/pixmaps

  install -m644 -D $srcdir/swiftweasel/icons/mozicon128.png \
	$pkgdir/usr/share/pixmaps/swiftweasel.png || return 1
  install -m644 $srcdir/swiftweasel.desktop \
	$pkgdir/usr/share/applications/ || return 1
  install -m644 $srcdir/swiftweasel-safe.desktop \
	$pkgdir/usr/share/applications/ || return 1

  # Translate
  unzip -o ${_pkglang}.xpi
  sed -i "s|jar:chrome/${_pkglang}.jar|jar:${_pkglang}.jar|" chrome.manifest || return 1
  install -D -m 644 chrome/${_pkglang}.jar ${pkgdir}/opt/${_pkgname}/chrome/${_pkglang}.jar || return 1
  install -D -m 644 chrome.manifest ${pkgdir}/opt/${_pkgname}/chrome/${_pkglang}.manifest || return 1
  rm ${pkgdir}/opt/${_pkgname}/chrome/en-US.jar
  rm ${pkgdir}/opt/${_pkgname}/chrome/en-US.manifest
  sed -i "s|en-US|${_pkglang}|" ${pkgdir}/opt/swiftweasel/defaults/pref/firefox-l10n.js || return 1
}
