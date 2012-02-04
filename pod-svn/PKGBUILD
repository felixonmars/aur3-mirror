
# Contributor: Yannick Poirier <contact@yannickpoirier.fr>
pkgname=pod-svn
pkgver=135
pkgrel=1
pkgdesc="This (Python/Qt) tool allows you to easily create FPGA bitfiles for your embedded system, from several Open Source IPs (compatibles with the OpenCores Wishbone bus) . It will also generates the corresponding drivers (currently only Linux ones)."
arch=('i686')
url="http://sourceforge.net/projects/periphondemand/"
license=('LGPL')
groups=()
depends=('python' 'pyparsing')
makedepends=('subversion')
provides=('pod')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=https://periphondemand.svn.sourceforge.net/svnroot/periphondemand/trunk
_svnmod=${pkgname}

# -------------------------------------------------------------------------
# - see http://www.armadeus.com/wiki/index.php?title=POD_installation_guide
# -------------------------------------------------------------------------
build() {

  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/${_svnmod}-build"

  msg "Make python POD distribution..."
  python setup.py sdist
  cd dist
  tar -zxvf PeriphOnDemand-*-*.tar.gz 
  cd PeriphOnDemand* #the current version is PeriphOnDemand-HEAD-59

  msg "Now install POD ..."
  python setup.py build
  python setup.py install --root="${pkgdir}" || return 1

  msg "--------------------------------------------------------------------"
  msg "please read http://www.armadeus.com/wiki/index.php?title=POD_Tutorial"
  msg "--------------------------------------------------------------------"


}
