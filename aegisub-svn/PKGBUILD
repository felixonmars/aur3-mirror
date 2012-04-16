# Maintainer: Alucryd <alucryd at gmail dot com>
# Contributor: 	G_Syme <demichan at mail dot upb dot de>

pkgname=aegisub-svn
pkgver=6699
pkgrel=1
pkgdesc="A general-purpose subtitle editor with ASS/SSA support"
arch=('i686' 'x86_64')
url="http://www.aegisub.net"
license=('GPL' 'BSD')
depends=('ffmpegsource' 'lua' 'wxgtk-2.9>=2.9.2' 'hunspell' 'libass' 'fftw' 'desktop-file-utils' 'curl')
makedepends=('subversion' 'intltool')
provides=('aegisub')
conflicts=('aegisub' 'aegisub-bin' 'aegisub-stable-svn')
install=icon.install

_svntrunk=http://svn.aegisub.org/trunk/aegisub/
_svnmod=aegisub


build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."
  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi
  msg "SVN checkout done or server timeout"
  cd "$_svnmod"
  ./autogen.sh --prefix=/usr --without-{portaudio,openal,oss,libpulse} --with-wxdir=/usr/include/wx-2.9 --with-wx-config=/usr/bin/wx-config-2.9
  make
}

package() {
    cd "${srcdir}/$_svnmod"
    make DESTDIR="$pkgdir" install
}

