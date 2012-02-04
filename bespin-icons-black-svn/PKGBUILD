# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>
pkgname=bespin-icons-black-svn
pkgver=1217
pkgrel=1
pkgdesc="Bespin black icon theme"
arch=(any)
url="http://kde-look.org/content/show.php/Bespin?content=63928"
license=('LGPL')
makedepends=('inkscape' 'imagemagick')
_svntrunk="https://cloudcity.svn.sourceforge.net/svnroot/cloudcity"
_svnmod="bespin"

_color=black
_basename=bespin

build() {
  cd ${srcdir}

  if [[ -d ${_svnmod}/.svn ]]; then
     (cd ${_svnmod} && svn up -r $pkgver)
  else
     svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  rm -rf ${srcdir}/${_svnmod}-build
  cp -r ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build

  install -d $pkgdir/usr/share/icons/
  cd $srcdir/$_svnmod-build/icons/
  echo "basename=$_basename" >> config
  echo "color=$_color" >> config
  echo "halo=white" >> config
  echo "alpha=85" >> config
  echo "" >> config
  ./generate_kde_icons.sh
  cp -r $srcdir/$_svnmod-build/icons/$_basename-$_color $pkgdir/usr/share/icons/
}
