# Contributor: Chris Baker <baker.chris.3@gmail.com>
pkgname=checkgmail-svn-notify-osd
pkgver=47
pkgrel=1
pkgdesc="An alternative Gmail Notifier for Linux and other *nix systems in svn version with notify-osd."
arch=('i686' 'x86_64')
url="http://checkgmail.sourceforge.net"
license=('GPL')
depends=('perl-gtk2-trayicon' 'perl-libwww' 'perl-crypt-ssleay' 
         'perl-xml-simple' 'notify-osd' 'libnotify')
optdepends=('perl-crypt-simple' 'perl-gtk2-sexy' 'perl-crypt-blowfish' 
	        'perl-freezethaw' 'perl-digest-md5' 'perl-mime-types' 
	        'perl-compress-zlib')
makedepends=('subversion')
conflicts=('checkgmail' 'checkgmail-svn' 'checkgmail-notify-osd')
provides=('checkgmail')
source=('checkgmail.desktop' 'checkgmail.png' 'checkgmail.patch')
md5sums=('5f55c1208e054552483834fd7b96d0e7'
         'f551f6cefb06201b03f8cb41fc85edb3'
		 '6f2da07e0b5743751c9d901185bfa051')
_svntrunk="http://checkgmail.svn.sourceforge.net/svnroot/checkgmail"
_svnmod=trunk

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  
  cd "$srcdir/$_svnmod"

  patch < ../checkgmail.patch || return 1

  install -D -m 755 $srcdir/$_svnmod/checkgmail $startdir/pkg/usr/bin/checkgmail || return 1
  install -D -m 644 $srcdir/$_svnmod/man/checkgmail.1.gz $startdir/pkg/usr/share/man/man1/checkgmail.1.gz || return 1
  install -D -m 644 $srcdir/checkgmail.desktop $startdir/pkg/usr/share/applications/checkgmail.desktop || return 1
  install -D -m 644 $srcdir/checkgmail.png $startdir/pkg/usr/share/pixmaps/checkgmail.png || return 1
}

