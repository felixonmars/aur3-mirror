# Contributor: twa022 <twa022 at gmail dot com>

pkgname=netbook-launcher-efl-bzr
_pkgname=netbook-launcher-efl
pkgver=172
pkgrel=1
pkgdesc="UNR legeraging the EFL for lower graphics power systems."
arch=('i686' 'x86_64')
url="https://code.launchpad.net/launch-lite-proj"
license=('GPL3')
depends=('liblauncher>=0.3' 'libunique' 'elementary-svn' 'libnotify>=0.3.2' 'libcanberra' 'libwnck')
makedepends=('bzr' 'gnome-common')
conflicts=('netbook-launcher-efl')
source=(label-full-clipper-no-color3.patch)
	
_bzrmod=$_pkgname
_bzrtrunk=lp:launch-lite-proj

build() {
  cd $startdir/src
  msg "Connecting to the server...."

  if [ -d ./$_bzrmod ]; then
    cd ./$_bzrmod && bzr up && cd ..
  else
    bzr branch $_bzrtrunk $_bzrmod
  fi

  [ -d ./$_bzrmod-build ] && rm -fr ./$_bzrmod-build
  cp -r ./$_bzrmod ./$_bzrmod-build
  cd ./$_bzrmod-build

  cd ${srcdir}/${_pkgname}-build
  patch -Np1 -i ${srcdir}/label-full-clipper-no-color3.patch
  sed -i 's:eina-0:eina:g' configure.ac
  ./autogen.sh --prefix=/usr --sysconfdir=/etc
  make all || return 1
  make DESTDIR=${pkgdir} install
  
}

md5sums=('08435fb1e4ea9ad8816209a1d2dd3f91')
