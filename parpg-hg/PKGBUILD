# Maintainer: Gadget3000 <gadget3000 at msn dot com>
pkgname=parpg-hg
pkgver=26
_pkgver=0.2.0
pkgrel=1
pkgdesc="Post-Apocalyptic Roleplaying Game"
arch=('any')
url="http://www.parpg.net/"
license=('GPL3' 'CCPL')
depends=('python2>=2.6' 'fife-git' 'python2-yaml')
makedepends=('mercurial')
conflicts=('parpg-svn')
replaces=('parpg-svn')
source=('parpg.desktop'
	'parpg.png')
md5sums=('65552e2b373bdf44d00564b5555b0fd0'
         '169fdfc1351e4338937fb5b70327a68b')

_hgroot=http://hg.assembla.com
_hgrepo="parpg-core"

build() {
  # Build core
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  sed -i "s/\#\!\/usr\/bin\/env python/\#\!\/usr\/bin\/env python2/" waf.py
  sed -i "s/\#\! \/usr\/bin\/env python/\#\!\/usr\/bin\/env python2/" waf_paths.py
  sed -i "s/\#\!\/usr\/bin\/env python/\#\!\/usr\/bin\/env python2/" wscript

  sed -i "s/\#\!\/usr\/bin\/env python/\#\!\/usr\/bin\/env python2/" $(find "$srcdir/$_hgrepo-build" | grep "\.py")
  sed -i "s/\#\! \/usr\/bin\/env python/\#\!\/usr\/bin\/env python2/" $(find "$srcdir/$_hgrepo-build" | grep "\.py")

  PYTHON="python2" python2 waf.py configure --prefix=/usr --sysconfdir=/usr/share/parpg --fifepath=/usr/lib/python2.7/site-packages
  PYTHON="python2" python2 waf.py build
  PYTHON="python2" python2 waf.py install --destdir="${pkgdir}"

  echo \#\!/bin/bash > ${pkgdir}/usr/bin/parpg
  echo export PYTHONPATH=\$\{PYTHONPATH\}:\"/usr/lib/python2.7/site-packages\" >> ${pkgdir}/usr/bin/parpg
  echo cd \$\(dirname \$0\) >> ${pkgdir}/usr/bin/parpg
  echo PYTHON=\"python2\" \"python2\" -m parpg.main \"/usr/share/parpg\" \$\@ >> ${pkgdir}/usr/bin/parpg

  sed "s/DataPath.*$/DataPath = \"\/usr\/share\/parpg\"/g" -i ${pkgdir}/usr/share/parpg/parpg.cfg  

  install -D -m644 $srcdir/parpg.png $pkgdir/usr/share/pixmaps/parpg.png
  install -D -m644 $srcdir/parpg.desktop $pkgdir/usr/share/applications/parpg.desktop
}
