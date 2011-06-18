# Maintainer: Deon 'PrinceAMD' Thomas <princeamd@elivecd.org>
# Contributor: Deon 'PrinceAMD' Thomas <princeamd@elivecd.org>

pkgname=smb-admin-svn
pkgver=5
pkgrel=1
pkgdesc="This program was designed to assist users in managing samba settings, shares and users. It's purpose it to be simple yet allow the user plenty of options. For a more powerful samba admin program, look at gsamabd or SWAT."
arch=('any')
license=('GPL')
url="http://code.google.com/p/princeamds-code/"
depends=('python' 'python-configobj')
source=()

_svntrunk="http://princeamds-code.googlecode.com/svn/trunk/Python/smb-admin"
_svnmod="smb-admin"


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
	mkdir -p "$pkgdir"/usr/sbin
	mkdir -p "$pkgdir"/usr/share
	mkdir -p "$pkgdir"/usr/share/pixmaps
	mkdir -p "$pkgdir"/usr/share/applications

	cp -a smb-admin/src/smb-usershare "$pkgdir"/usr/bin/
	cp -a smb-admin/src/smb-admin "$pkgdir"/usr/sbin/
	cp -r smb-admin/src/smb-admin.desktop "$pkgdir"/usr/share/applications/
	cp -r smb-admin/src/smb-admin.png "$pkgdir"/usr/share/pixmaps/

	chmod -R 755 "$pkgdir"
}
