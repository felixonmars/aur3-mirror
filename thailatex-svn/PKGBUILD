# Contributor: Smith Dhumbumroong <zodmaner at gmail dot com>

pkgname=thailatex-svn
pkgver=270
pkgrel=1
pkgdesc="ThaiLaTeX is a package which enables typesetting Thai language with LaTeX's standard document classes (SVN version)"
arch=(i686 x86_64)
license=('LPPL')
depends=('texlive-core' 'swath' 'sh')
conflicts=('thailatex')
makedepends=('texlive-bin' 'ghostscript')
groups=('texlive-lang')
install=$pkgname.install
url="http://linux.thai.net/projects/thailatex"
source=()
md5sums=()

_svntrunk=http://linux.thai.net/svn/software/thailatex/trunk
_svnmod=thailatex

build() {

  msg "Updating SVN entries for $_svnmod ..."

  cd ${srcdir}
  svn co $_svntrunk $_svnmod
  cd $_svnmod
  ./autogen.sh

  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-texmfdir=/usr/share/texmf-dist || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

