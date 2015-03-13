# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: David Roheim <david dot roheim at gmail dot com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>
# Contributor: shining
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>

_pkgname=bash-completion
pkgname=bash-completion-git
pkgver=2.1.r178.g80c2bb6
pkgrel=1
pkgdesc="Programmable completion for the bash shell, git version"
arch=(any)
url="http://bash-completion.alioth.debian.org/"
license=('GPL')
depends=('bash')
makedepends=('git')
conflicts=('bash-completion')
provides=('bash-completion')
source=("git://git.debian.org/git/bash-completion/bash-completion.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  autoreconf -i
}

build() {
  cd "$srcdir/$_pkgname"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install

# bash-completion is sourced in /etc/bash.bashrc so that non-bash shell don't source it
  rm "${pkgdir}/etc/profile.d/bash_completion.sh"

# remove Slackware's makepkg completion
  rm "${pkgdir}/usr/share/bash-completion/completions/makepkg"
}
# vim:set ts=2 sw=2 et:
