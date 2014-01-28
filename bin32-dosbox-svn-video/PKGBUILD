#Contributor: Cameron Spry <spryct@rose-hulman.edu> (bin32-dosbox-svn)
#Maintainer: Maximilien Noal <noal dot maximilien at gmail dot com> [AUR: xcomcmdr]

pkgname=bin32-dosbox-svn-video
_pkgbase=dosbox
pkgver=r3858
pkgrel=1
pkgdesc="32-bit SVN DOSBox, with threaded video capturing patch"
arch=('x86_64')
url="http://www.dosbox.com"
license=('GPL')
depends=('lib32-sdl_sound' 'lib32-alsa-lib' 'lib32-sdl_net' 'lib32-libpng' 'lib32-libgl')
makedepends=('subversion')
provides=(dosbox)
source=("${_pkgbase}"::'svn+https://dosbox.svn.sourceforge.net/svnroot/dosbox/dosbox/trunk'
	'hardware.patch'
	'dosbox.png'
        'dosbox.desktop')
sha1sums=('SKIP'
	'fe56985496db5a08af220c538ac2cb6285925743'
	'1279b43a3f1fd833db4d85e06fa583ed9f606ec1'
	'dbd7fd8addaf8062895b5f02d808d12c02bb5695')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}"

  cd ${srcdir}/${_pkgbase}

  export CC='gcc -m32'
  export CXX='g++ -m32'

  patch -i ${srcdir}/hardware.patch src/hardware/hardware.cpp

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc/dosbox LDFLAGS="-L/usr/lib32" --build=i686-pc-linux-gnu  
  make
}

package() {
  cd "${srcdir}/${_pkgbase}"
  make DESTDIR="${pkgdir}/" install
}
