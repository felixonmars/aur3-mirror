# Maintainer: murchik <mixturchik@gmail.com>

pkgname=ack2-git
pkgver=20130710
pkgrel=1
pkgdesc="A Perl-based grep replacement, aimed at programmers with large trees of heterogeneous source code. Clone of ack-git package, but 2nd version repo. Also --ignore-dir match: filter patch included."
arch=('any')
url="http://betterthangrep.com/"
license=('GPL' 'PerlArtistic')
depends=('perl-file-next')
makedepends=('git')
provides=('ack')
conflicts=('ack', 'ack-git')
options=('!emptydirs')
source=('ignore-dir-match.patch.diff')
md5sums=('0f36efede294e2e1583c47fa70d0ee12')

_gitroot=git://github.com/petdance/ack2.git
_gitname=ack2

build() {
  cd $srcdir

  msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname
    git checkout dev
    git pull
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  patch $srcdir/$_gitname/ack < ignore-dir-match.patch.diff

  cd "$srcdir/$_gitname"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  find "$pkgdir" \( -name '.packlist' -o -name 'perllocal.pod' \) -delete
}
