pkgname=vimana-git
pkgver=20110103
pkgrel=1
pkgdesc="Easy searching,installing and downloading vim script."
arch=('any')
url="https://github.com/c9s/Vimana"
license=('Perl')
depends=('perl' 'perl-module-install')
makedepends=('git')
provides=('vimana')
options=('!emptydirs')

_gitroot=git://github.com/c9s/Vimana.git
_gitname=Vimana

build() {
cd $srcdir

msg "Connecting to github.com GIT server...."

if [ -d $startdir/src/$_gitname ] ; then
  cd $_gitname && git-pull origin
  msg "The local files are updated."
else
  git clone $_gitroot
fi

msg "GIT checkout done or server timeout"

cd "$srcdir/$_gitname"
PERL_MM_USE_DEFAULT=1 perl Makefile.PL
INSTALLDIRS=vendor || return 1
make || return 1
make DESTDIR="$pkgdir" install || return 1
find "$pkgdir" \( -name '.packlist' -o -name 'perllocal.pod' \) -delete
}
