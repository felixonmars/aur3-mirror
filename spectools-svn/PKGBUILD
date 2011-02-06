# Contributor: Lex Rivera <x-demon@x-demon.org>
 pkgname=spectools-svn
 pkgver=2888
 pkgrel=1
 pkgdesc="Spectrum-Tools is a set of utilities for using the Wi-Spy USB spectrum analyzer hardware. SVN version."
 arch=('i686' 'x86_64')
 url="http://code.google.com/p/madwimax/"
 license=('GPL2')
 depends=('bash' 'libusb1' 'gtk2' 'cairo')
 makedepends=('subversion' 'asciidoc' 'docbook-xsl' 'docbook2x')
 provides=('spectools')
   
 _svnmod="spectools"
 _svntrunk="https://www.kismetwireless.net/code/svn/tools/spectools"
 
 build() {
  cd ${srcdir}
  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  cp -r ./$_svnmod ./$_svnmod-build
  cd ./$_svnmod-build

  autoreconf --install
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$pkgdir install || return 1

}
# vim:syntax=sh
