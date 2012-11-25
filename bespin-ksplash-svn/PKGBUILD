# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>
pkgname=bespin-ksplash-svn
pkgver=1631
pkgrel=1
pkgdesc="Bespin KSplash theme"
arch=(any)
url="http://kde-look.org/content/show.php/Bespin?content=63928"
license=('LGPL')

_svntrunk="https://cloudcity.svn.sourceforge.net/svnroot/cloudcity"
_svnmod="bespin"

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

  mkdir -p $pkgdir/usr/share/apps/ksplash/Themes/Bespin
  mkdir -p $pkgdir/usr/share/apps/ksplash/Themes/Tibanna


  cd $srcdir/$_svnmod-build/ksplash/bespin
   #4:3
   ./generate.sh 640 480
   ./generate.sh 800 600
   ./generate.sh 1024 768
   ./generate.sh 1280 960
   ./generate.sh 1400 1050
   ./generate.sh 1600 1200
   
   #16:9
   ./generate.sh 1280 720
   ./generate.sh 1365 768
   ./generate.sh 1600 900
   ./generate.sh 1920 1080    

   #16:10
   ./generate.sh 1440 900
   ./generate.sh 1680 1050
   ./generate.sh 1920 1200

   cd $srcdir/$_svnmod-build/ksplash/tibanna
   #4:3
   ./generate.sh 640 480
   ./generate.sh 800 600
   ./generate.sh 1024 768
   ./generate.sh 1280 960
   ./generate.sh 1400 1050
   ./generate.sh 1600 1200

   #16:9
   ./generate.sh 1280 720
   ./generate.sh 1365 768
   ./generate.sh 1600 900
   ./generate.sh 1920 1080

   #16:10
   ./generate.sh 1440 900 
   ./generate.sh 1680 1050
   ./generate.sh 1920 1200

   cp -r $srcdir/$_svnmod-build/ksplash/bespin/* $pkgdir/usr/share/apps/ksplash/Themes/Bespin/
   cp -r $srcdir/$_svnmod-build/ksplash/tibanna/* $pkgdir/usr/share/apps/ksplash/Themes/Tibanna/
}
