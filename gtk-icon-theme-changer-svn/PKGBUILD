# Maintainer: Deon 'PrinceAMD' Thomas <princeamd@elivecd.org>
# Contributor: Deon 'PrinceAMD' Thomas <princeamd@elivecd.org>

pkgname=gtk-icon-theme-changer-svn
pkgver=3
pkgrel=1
pkgdesc="This program was designed to assist users in changing gtk icon themes."
arch=('any')
license=('GPL')
url="http://code.google.com/p/princeamds-code/"
depends=('python2')
source=()

_svntrunk="http://princeamds-code.googlecode.com/svn/trunk/Python"
_svnmod="gtk-icon-theme-changer"


build() {
	cd "$srcdir"

  msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
	mkdir -p "$pkgdir"/usr/bin
	cp -a gtk-icon-theme-changer/gtk-icon-themes.py "$pkgdir"/usr/bin/gtk-icon-theme-changer
	chmod -R 755 "$pkgdir"
}
