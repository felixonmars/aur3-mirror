# Contributor: Jerome Berger <jeberger@free.fr>
pkgname=gdc1-tango-svn
pkgver=5599
pkgrel=1
pkgdesc="Runtime library for the D programming language (gdc version)"
arch=(i686 x86_64)
url="http://www.dsource.org/projects/tango/"
license=('custom')
depends=('gdc1-hg')
options=('!libtool' '!emptydirs')
install=
source=()

_svntrunk=http://svn.dsource.org/projects/tango/trunk
_svnmod=$pkgname

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    msg "Updating the SVN local copy to revision $pkgver"
    cd $_svnmod
    svn up -r $pkgver
  else
    msg "Getting the source for SVN revision $pkgver"
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    cd $_svnmod
  fi

  msg "Compiling Tango"
  ./build/script/bob.sh --user --runtime gdc
}

package() {
  cd "$srcdir/$_svnmod"

  _gdcversion=$(gdc -dumpversion)
  install -Dm 755 libtango.a ${startdir}/pkg/usr/lib/libtango.a
  install -Dm 644 object.di ${startdir}/pkg/usr/include/d/$_gdcversion/object.di.tango
  cp -a tango ${startdir}/pkg/usr/include/d/$_gdcversion
}

# vim:set ts=2 sw=2 et:
