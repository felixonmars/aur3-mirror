
# Contributor: Joseph R. Nosie <bolts at archlinux dot us>
pkgname=steamroller-git
_pkgname=steamroller
pkgver=20101027
pkgrel=1
pkgdesc="A makepkg and repo-add wrapper with AUR support."
arch=('any')
url="http://www.github.com/Bolts/steamroller/"
license=('GPL')
depends=('perl' 'perl-libwww' 'perl-json' 'perl-crypt-ssleay' 'pacman')
makedepends=('git')
optdepends=('sudo: for pacman calls as normal user')
provides=('steamroller')
conflicts=()
backup=(etc/steamroller.conf)
install='steamroller.install'

_gitroot="git://github.com/Bolts/steamroller.git"
_gitname="steamroller"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_gitname/"
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete

  install -d $pkgdir/etc
  install -Dm644 conf/steamroller.conf $pkgdir/etc/

} 

# vim: set ts=2 sw=2 et:
