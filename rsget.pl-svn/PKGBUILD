# Maintainer: J. W. Birdsong <jwbirdsong AT gmail DOT com>

pkgname=rsget.pl-svn
pkgver=11681
pkgrel=3
pkgdesc="A  powerful perl application designed to retrieve files from download services (like RapidShare, MegaUpload and many more)"
arch=('i686' 'x86_64')
url="http://rsget.pl"
license=('GPL2')
depends=('perl-gd' 'tesseract' 'perl-uri' 'perl-www-curl')
optdepends=('imagemagick:better support for MegaUpload captcha (higher probability of success)' 'perl-crypt-blowfish:required for Link/SecuredIn'  'perl-crypt-rijndael:required for Link/CryptIt' 'perl-term-size:allows to redraw the screen correctly after terminal size change')
makedepends=('subversion')

_svntrunk=http://svn.pld-linux.org/svn/toys/
_svnmod=rsget.pl

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build/$_svnmod"
  #
  # BUILD
  #
    make PREFIX=/usr  DESTDIR="$pkgdir/" install
}
