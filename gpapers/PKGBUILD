# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=gpapers
pkgver=150
pkgrel=1
pkgdesc="The open-sourced, Gnome based digital library manager. Think of it as an iTunes for your PDFs"
arch=('any')
url="http://code.google.com/p/gpapers"
license=('GPL2')
depends=('python2-poppler' 'python-pysqlite' 'pygtk' 'python-pygraphviz' 'django' 'gnome-python')
makedepends=('svn')
source=("gpapers.sh")
md5sums=('fb296b5eff8d5821894e43899344922d')

_svntrunk=http://gpapers.googlecode.com/svn/trunk
_svnmod=gpapers

package() {
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
  rm -fr ext website 

  #
  # BUILD
  #
  find . -name "*py" -exec sed 's/env python/env python2/' -i {} \;
  install -d "$pkgdir/usr/lib/python2.7/${pkgname}"
  cp -r * "$pkgdir/usr/lib/python2.7/${pkgname}/"
  install -Dm755 "${srcdir}/gpapers.sh" "$pkgdir/usr/bin/gpapers"
  rm -rf $(find "$pkgdir" -type d -name ".svn")
  
}
