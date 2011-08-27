# Contributor: vti <viacheslav.t AT gmail.com>
pkgname=perl-mojo-git
_realname=Mojo
pkgver=20090812
pkgrel=1
pkgdesc="Perl/CPAN Module Mojo: The Web In A Box!"
arch=('i686' 'x86_64')
license=('PerlArtistic')
url="http://mojolicious.org"
depends=('perl>=5.10.0')
source=()
md5sums=()
options=(!emptydirs)

_gitroot='git://github.com/kraih/mojo'
_gitname='mojo'

build() {
  cd $startdir/src

  msg "Connecting to github.com GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
      cd $_gitname
  fi

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
