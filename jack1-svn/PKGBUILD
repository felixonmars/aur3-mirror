#the dependencies are either undocumented or buried somewhere deep, because
#not a one google search could devine them for me. You'll have to sort
#these out on your own and then let me know what to add to the PKGBUILD.

# DO NOT USE THIS WITHOUT REVIEWING IT CAREFULLY.
# It is not properly made.
# I only made this pkgbuild because I couldn't figure
# out any other way to install a newer version of jack1
# and have my computer know it was installed.

pkgname="jack1-svn"
pkgrel=1
pkgver=0.120.0
pkgdesc="Advanced low-latency sound driver. Subversion release."
arch=('x86_64')
url="http://jackaudio.org"
license=('GPL' 'LGPL')
depends=()
makedepends=('subversion')
provides=('jack-audio-connection-kit' 'jack')
conflicts=('jack2')

build() {
  svn co http://subversion.jackaudio.org/jack/trunk/jack
  cd jack
  ./autogen.sh
  ./configure --prefix=/usr --enable-optimize --disable-oss --disable-sun --disable-freebob --disable-firewire --with-gnu-ld
  make -j2

  make install
}
