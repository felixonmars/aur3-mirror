# Contributor: mightyjaym <jm.ambrosino@free.fr>

pkgname=swiftweasel-athlon64-de
_pkgname=swiftweasel
_pkgproc=athlon64
_pkgdate="06-18-08"
_lang=de
pkgver=3.0
pkgrel=1
pkgdesc="Mozilla Firefox optimized build for AMD 64bit processors. German version."
arch=('i686' 'x86_64')
url="http://swiftweasel.sourceforge.net/"
license=('MPL' 'GPL' 'LGPL')
depends=('mozilla-common' 'desktop-file-utils' 'xulrunner')
provides=('firefox' 'swiftweasel')
conflicts=('swiftweasel' 'swiftweasel3')

if [ "$CARCH" = "x86_64" ]; then
	_nbits=64bit
	md5sums=('310b9e034c04788d67e0802b02cd747a' 'e02fc1051ff31e05e45ec99eb38e16f6' 'eef46b6617fb0dab69037c122793c6fb' '635d3d7ab3d00d216cb536597da10811')

else 	_nbits=32bit
	md5sums=('17822be8385292140ecab0f6978fbad3' 'e02fc1051ff31e05e45ec99eb38e16f6' 'eef46b6617fb0dab69037c122793c6fb' '8f69a6704b1ef174ed2ac02f5d6ef4bb')
fi

source=(http://downloads.sourceforge.net/swiftweasel/swiftweasel-${pkgver}_${_pkgdate}_${_pkgproc}-${_nbits}.tar.gz
        swiftweasel.desktop
        swiftweasel-safe.desktop
	ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/linux-i686/xpi/${_lang}.xpi)

build() {

  cd $startdir/src/
  mkdir $startdir/pkg/opt/
  cp -r ${_pkgname} $startdir/pkg/opt/${_pkgname}
  chmod -R 775 $startdir/pkg/opt/${_pkgname}/extensions/*
  mkdir -p $startdir/pkg/usr/bin
  ln -s /opt/${_pkgname}/${_pkgname} $startdir/pkg/usr/bin/${_pkgname}
  rm $startdir/pkg/opt/${_pkgname}/libxul.so
  ln -sf /usr/lib/xulrunner/libxul.so $startdir/pkg/opt/${_pkgname}/libxul.so

  install -d -m755 $startdir/pkg/usr/share/{applications,pixmaps}

  install -m644 -D $startdir/src/swiftweasel/icons/mozicon128.png $startdir/pkg/usr/share/pixmaps/swiftweasel.png || return 1
  install -m644 $startdir/src/swiftweasel.desktop $startdir/pkg/usr/share/applications/ || return 1
  install -m644 $startdir/src/swiftweasel-safe.desktop $startdir/pkg/usr/share/applications/ || return 1

  # Traduction FR
  unzip -o ${_lang}.xpi
  sed -i "s|jar:chrome/${_lang}.jar|jar:${_lang}.jar|" chrome.manifest || return 1
  install -D -m 644 chrome/${_lang}.jar ${startdir}/pkg/opt/${_pkgname}/chrome/${_lang}.jar || return 1
  install -D -m 644 chrome.manifest ${startdir}/pkg/opt/${_pkgname}/chrome/${_lang}.manifest || return 1
  rm ${startdir}/pkg/opt/${_pkgname}/chrome/en-US.jar
  rm ${startdir}/pkg/opt/${_pkgname}/chrome/en-US.manifest
  sed -i "s|en-US|${_lang}|" ${startdir}/pkg/opt/swiftweasel/defaults/pref/firefox-l10n.js || return 1
}
