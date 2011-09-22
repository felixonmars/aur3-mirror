# Contributor: Andrew Grigorev <andrew@ei-grad.ru>
pkgname=lxctl-git
pkgver=20110922
pkgrel=2
pkgdesc="Utility to manage LXC containers, written in Perl."
arch=(any)
url="http://lxc.tl"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'lxc' 'lvm2' 'bridge-utils' 'perl-ipc-system-simple' 'perl-linux-lvm' 'perl-yaml-tiny' 'perl-net-ssh')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=(etc/lxctl/lxctl.yaml)
options=()
install=
source=()
md5sums=()

_gitroot=https://github.com/lxctl/lxctl.git
_gitname=lxctl
#_gitbranch=refactoring
_gitbranch=master

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" -b "$_gitbranch"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  sed -i s,/usr/lib/perl/5.10,/usr/share/perl5/vendor_perl,g Makefile

  make || return 1
  make install DESTDIR="$pkgdir" || return 1

  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
