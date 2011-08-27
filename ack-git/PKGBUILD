# Maintainer: Ismael Carnales <icarnales@gmail.com>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Michael S. Walker <barrucadu@localhost>

pkgname=ack-git
pkgver=20091126
pkgrel=1
pkgdesc="A Perl-based grep replacement, aimed at programmers with large trees of heterogeneous source code"
arch=('any')
url="http://betterthangrep.com/"
license=('GPL' 'PerlArtistic')
depends=('perl-file-next')
makedepends=('git')
provides=('ack')
conflicts=('ack')
options=('!emptydirs')

_gitroot=git://github.com/petdance/ack.git
_gitname=ack

build() {
  cd $srcdir

  msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  find "$pkgdir" \( -name '.packlist' -o -name 'perllocal.pod' \) -delete
}
