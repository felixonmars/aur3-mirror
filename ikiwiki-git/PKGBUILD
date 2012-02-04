# Contributor: Will Chappell <mr.chapendi@gmail.com>
pkgname=ikiwiki-git
pkgver=20091107
pkgrel=1
pkgdesc="Ikiwiki is a wiki compiler. It converts wiki pages into HTML pages suitable for publishing on a website."
arch=('i686' 'x86_64')
url="http://ikiwiki.info/"
license=('GPL')
groups=()
depends=(perl-text-markdown perl-cgi-session perl-cgi-formbuilder perl-timedate
perl-html-parser perl-html-scrubber perl-mail-sendmail perl-time-duration
perl-uri perl-html-template perl-locale-gettext)
makedepends=('git')
provides=(ikiwiki)
conflicts=(ikiwiki)
_gitroot="git://git.ikiwiki.info/"
_gitname="git.ikiwiki.info"

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

  eval `perl -V:archname`
  # Force module installation to "current" perl directories
  perl Makefile.PL PREFIX="/usr" \
      INSTALLARCHLIB=/usr/lib/perl5/current/${archname} \
      INSTALLSITELIB=/usr/lib/perl5/site_perl/current \
      INSTALLSITEARCH=/usr/lib/perl5/site_perl/current/${archname}
  make PREFIX="/usr" || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # otherwise perl breaks
  find $startdir/pkg -name '.packlist' -exec rm '{}' \;
  find $startdir/pkg -name '*.pod' -exec rm '{}' \;

} 
