# Maintainer: mirandir <mirandir@orange.fr>

pkgname=skype4empathy
pkgver=20110407
pkgrel=4
pkgdesc=("Skype plugin for Empathy. The official Skype client must be running. This plugin uses the skype4pidgin plugin with libpurple and telepathy-haze.")
arch=("i686" "x86_64")
url=("http://eion.robbmob.com/")
license=('GPL')
depends=('empathy' 'skype' 'libpurple' 'telepathy-haze')
makedepends=('tar' 'binutils')
conflicts=('skype4pidgin' 'skype4pidgin-svn')
replaces=('skype4pidgin' 'skype4pidgin-svn')
source=('http://eion.robbmob.com/skype4pidgin.deb' 'https://bugs.launchpad.net/skype/+bug/567248/+attachment/2066092/+files/hicolor.tar.gz')
md5sums=('964ef2bae9c2e6cda70096a75466d120'
         '86b3f3db996f6a2eea86cc8ef1f09bb4')

package() {
  cd ${srcdir}
  ar xv skype4pidgin.deb || return 1
  tar xzf data.tar.gz || return 1
  
  install -d $pkgdir/usr/lib/purple-2
  install -d $pkgdir/usr/share/empathy/icons
  cd $srcdir/usr/lib/purple-2/
  
  if [[ "${CARCH}" == "x86_64" ]]; then
        cp libskype64.so $pkgdir/usr/lib/purple-2/
        cp libskype_dbus64.so $pkgdir/usr/lib/purple-2/
  elif [[ "${CARCH}" == "i686" ]]; then
        cp libskype.so $pkgdir/usr/lib/purple-2/
        cp libskype_dbus.so $pkgdir/usr/lib/purple-2/
  fi
  
  cd $pkgdir/usr/share/empathy/
  cp -r ${srcdir}/hicolor/ icons/

}
