# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=pysatellites-svn
_pkgname=pysatellites
pkgver=61
pkgrel=3
pkgdesc="PySatellites is a simulator of 2D trajectories of satellites"
url='http://outilsphysiques.tuxfamily.org/pmwiki.php/Oppl/Pysatellites'
license=('GPL3') 
arch=('any')
depends=('python2-qt' 'python2' 'python-matplotlib' 'xplanet' 'celestia')
makedepends=('docbook-xsl')
source=($pkgname.desktop
	$pkgname.png
	${_pkgname}.sh)
_svntrunk=svn://svn.tuxfamily.org/svnroot/oppl/${_pkgname}/trunk
_svnmod=${_pkgname}

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

  find -name "*py" -exec sed 's/python/python2/' -i {} \;

  pyuic4 graphe.ui > UI_graphe.py
  pyuic4 pysat.ui > UI_pysat.py
  xsltproc --nonet /usr/share/xml/docbook/xsl-stylesheets-1.76.1/manpages/docbook.xsl manpage.xml
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

package() {
  cd $srcdir/$_svnmod-build
  install -D -m755 ${srcdir}/${_pkgname}.sh $pkgdir/usr/bin/${_pkgname}
  install -D -m644 ${_pkgname}.1 $pkgdir/usr/share/man/man1/${_pkgname}.1
  # Creating menu item
  install -D -m644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/${_pkgname}.png
  install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
}


md5sums=('7e32597d54dd793bb8aa2695a766e083'
         '4dcce3ad8fbf1e0309a4505136ded7ec'
         'a5a2890b2e691c6d55cd71dd2af9a90b')
