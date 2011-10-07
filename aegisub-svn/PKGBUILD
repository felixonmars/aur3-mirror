# Contributor : G_Syme <demichan at mail dot upb dot de>
# Maintainer : Alucryd <alucryd at gmail dot com>
pkgname=aegisub-svn
pkgver=5686
pkgrel=1
pkgdesc="Aegisub Advanced Subtitle Editor"
url="http://www.aegisub.org"
arch=('i686' 'x86_64')
license=('BSD')
depends=('wxgtk>=2.9' 'pulseaudio' 'lua' 'ffmpegsource' 'libass' 'hunspell' 'fontconfig')
makedepends=('subversion' 'intltool')
provides=('aegisub')
conflicts=('aegisub-bin' 'aegisub-stable-svn')
install=('icon.install')
 
build() {
  cd ${srcdir}
  if [ -d aegisub ]; then
    cd aegisub && svn up
  else
    svn co http://svn.aegisub.org/trunk/aegisub
    cd aegisub
  fi
  ./autogen.sh --prefix=/usr --without-{portaudio,openal}
  make
}
 
package() {
  cd ${srcdir}/aegisub
  make DESTDIR="${pkgdir}" install
  make distclean
}
