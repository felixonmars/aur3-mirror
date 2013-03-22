# Maintainer: LHFB <200_Ok@gmx.com>
pkgname=zatellite-git
_pkgname=zatellite
pkgver=20130318
pkgrel=1
pkgdesc="Simple and minimalist email checker with GUI"
arch=('i686' 'x86_64')
url="https://github.com/zatellite/zatellite"
license=('GPL')
groups=('network')
depends=('shoes-git' 'ruby-bundler')
makedepends=('git')
conflicts=('ruby 2.0.0')
install=zatellite.install
source=("https://raw.github.com/zatellite/zatellite/master/zatellite.rb")
md5sums=('9743eeb2a6840aa376aad5e37879b650')

_gitroot="git://github.com/${_pkgname}/${_pkgname}.git"
_gitname="${_pkgname}"


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

  mkdir -p $pkgdir/usr/share/${_pkgname}
  mkdir -p $pkgdir/usr/bin
  
  cp -r $srcdir/$_gitname-build/*  $pkgdir/usr/share/${_pkgname}/
  cd $pkgdir/usr/share/${_pkgname}/
  bundle install
  ln -s $pkgdir/usr/share/${_pkgname}/Install/arch_run.sh $pkgdir/usr/bin/${_pkgname}
  chmod -R 777 $pkgdir/usr/share/${_pkgname}/
  chmod a+x $pkgdir/usr/bin/${_pkgname}

}
# vim:set ts=2 sw=2 et:

