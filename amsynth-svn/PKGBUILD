# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: James Morris <jwm.art.net@gmail.com>
# 
pkgname=amsynth-svn
pkgver=444
pkgrel=1
pkgdesc="Analogue Modeling SYNTHesizer"
arch=('i686' 'x86_64')
url="http://code.google.com/p/amsynth/"
license=('GPL')
depends=('gtkmm' 'alsa-lib' 'jack' 'libsndfile' 'lash' 'unzip')
makedepends=('subversion' 'pkgconfig' 'autoconf' 'automake')
conflicts=('amsynth')
provides=('amsynth')
source=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=http://amsynth.googlecode.com/svn/trunk
_svnmod=amsynth

# heavily based upon aqualung-svn PKGBUILD:

build() {
  cd ${srcdir}

  if [ -d ${_svnmod}/.svn ]; then
    cd $_svnmod && svn up -r $pkgver && cd ${srcdir}
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  if [ -d $_svnmod-build ]; then rm -rf $_svnmod-build; fi
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh || automake -a || return 1
  ./configure --prefix=/usr

# fix something or other to do with capitalization:
# sed -i -e 's|/amSynth|/amsynth|' src/main.cc
# commented out due to breaking skin location (see below)

  make || return 1
  make DESTDIR=${pkgdir} install
  install -D -m644 amsynth.desktop $startdir/pkg/usr/share/applications/amsynth.desktop
  install -D -m644 amsynth.png $startdir/pkg/usr/share/pixmaps/amsynth.png
  install -D -m644 amsynth-skin.zip $startdir/pkg/usr/share/amSynth/amsynth-skin.zip
}

