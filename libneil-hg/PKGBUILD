# Contributor: Berkus <berkus@madfire.net>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=libneil-hg
pkgver=555
pkgrel=1
pkgdesc="A Buzz-like tracker library, fork of armstrong"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://sites.google.com/site/neilsequencer/"
makedepends=('boost' 'mercurial' 'scons')
depends=('fftw' 'liblo' 'python2' 'libmad' 'alsa-lib' 'libsamplerate')
optdepends=('ladspa: ladspa plugins support'
			'dssi: dssi plugins support' 
			'jack: jack sound server support')
provides=('libneil')
conflicts=('aldrin' 'armstrong')

_hgroot="http://bitbucket.org/bucket_brigade"
_hgrepo=libneil

build() {

  cd "$srcdir"
  msg "Connecting to Mercurial server...."
  if [ -d $_hgrepo ]; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot/$_hgrepo $_hgrepo
  fi

  msg "Mercurial clone done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  # Python2 fixes
  export PYTHON="python2"
  sed \
	-e "s_\(env python\).*_\12_" \
	-e "s_\(bin/python\).*_\12_" \
	-i `grep -rlE "(env python|bin/python)" .`
  sed -i "s_'python_&2_" SConstruct

  # Build

  scons configure PREFIX=/usr DESTDIR="$pkgdir/"
  scons
}

package() {

  cd "$srcdir/$_hgrepo-build"

  scons install
}
