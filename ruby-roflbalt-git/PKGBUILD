# Maintainer: Eugene Nikolsky <pluton dot od at gmail dot com>
_gemname=roflbalt
pkgname=ruby-$_gemname-git
pkgver=20120129
pkgrel=1
pkgdesc="A Canabalt-inspired sidescroller in ASCII (with ANSI color!) for your console."
arch=(any)
url="https://github.com/pda/roflbalt"
license=('MIT')
depends=('ruby>=1.9')
makedepends=('rubygems' 'git')
install='.install'

_gitroot='git://github.com/pda/roflbalt.git'
_gitname=$_gemname

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname"
}

# vim:set ts=2 sw=2 et:
