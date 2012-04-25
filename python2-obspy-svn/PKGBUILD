pkgname=python2-obspy-svn
pkgver=3749
pkgrel=1
pkgdesc="A Python Toolbox for seismology/seismological observatories."
arch=('i686' 'x86_64')
url="http://obspy.org/"
license=('GPL3')
groups=()
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib' 'python2-lxml')
makedepends=('subversion' 'python2-distribute')
provides=('obspy')
conflicts=('obspy')
options=()
install=
source=()
noextract=()
md5sums=()
sha256sums=()

PACKAGES="core mseed arclink db earthworm gse2 imaging iris neries sac seg2 \
segy seisan seishub sh signal taup wav xseed"

# go from here to ObsPy root directory
cd ../..

_svntrunk=https://svn.obspy.org/trunk
_svnmod=obspy

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

}

package() {
  cd "$srcdir/$_svnmod-build"

  for NAME in $PACKAGES; do

    echo Installing $NAME

    cd obspy.$NAME

    if [ $NAME = 'wav' ]; then
       sed -i -e'12,15d' setup.cfg
    fi

    python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1

    cd ..

  done
}

# vim:set ts=2 sw=2 et:
