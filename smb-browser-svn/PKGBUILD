# Maintainer: Deon 'PrinceAMD' Thomas <princeamd@elivecd.org>
# Contributor: Deon 'PrinceAMD' Thomas <princeamd@elivecd.org>

pkgname=smb-browser-svn
pkgver=5
pkgrel=1
pkgdesc="This program was designed to assist users in finding and mounting samba shared folders on a network while being easy yet functional."
arch=('any')
license=('GPL')
url="http://code.google.com/p/princeamds-code/"
depends=('python2' 'python-configobj')
source=()

_svntrunk="http://princeamds-code.googlecode.com/svn/trunk/Python/smb-browser"
_svnmod="smb-browser"


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
	mkdir -p "$pkgdir"/usr/share
	mkdir -p "$pkgdir"/usr/share/pixmaps
	mkdir -p "$pkgdir"/usr/share/applications
	
	cp -a smb-browser/src/smb-browser "$pkgdir"/usr/bin/
	cp -r smb-browser/src/smb-browser.desktop "$pkgdir"/usr/share/applications/
	cp -r smb-browser/src/smb-browser.png "$pkgdir"/usr/share/pixmaps/

	chmod -R 755 "$pkgdir"
}
