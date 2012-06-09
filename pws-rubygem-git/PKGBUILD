#Maintained by ivoarch <ivkuzev@gmail.com>  
pkgname=pws-rubygem-git
pkgver=20120609
pkgrel=1
pkgdesc="Command-line password safe/manager written in Ruby."
arch=('i686' 'x86_64')
url="https://github.com/janlelis/pws"
license=('MIT')
depends=(ruby)
makedepends=('git')

_gitroot=git://github.com/janlelis/pws.git
_gitname=pws

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d $pkgdir/usr/bin/
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --install-dir "$pkgdir$_gemdir" --bindir $pkgdir/usr/bin pws
}

