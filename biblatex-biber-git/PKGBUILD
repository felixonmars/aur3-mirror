# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=biblatex-biber-git
pkgver=20110216
pkgrel=1
pkgdesc="A BibTeX replacement for users of biblatex"
url="http://biblatex-biber.sourceforge.net"
arch=('any')
license=('PerlArtistic')
depends=('perl-xml-libxml-simple' 'perl-readonly-xs' 'texlive-bibtexextra' \
  'perl-file-slurp-unicode' 'perl-xml-writer' 'perl-text-bibtex' \
  'perl-list-allutils' 'perl-data-dump' 'perl-log-log4perl' \
  'perl-regexp-common' 'perl-latex-decode>=0.03' 'perl-ipc-run' \
  'perl-unicode-collate>=0.67' 'perl-config-general')
optdepends=('perl-sleepycat-dbxml')
provides=('biblatex-biber')
conflicts=('biblatex-biber')
source=()
md5sums=()
  
_gitroot="git://${pkgname}.git.sourceforge.net/gitroot/${pkgname%-git}/${pkgname%-git}"
_gitname="${pkgname%-git}"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  perl Build.PL installdirs=vendor destdir="$pkgdir/" 
  ./Build 
  ./Build install 
}
