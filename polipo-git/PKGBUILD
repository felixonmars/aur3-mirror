# Maintainer: Chen Zhiqiang <chenzhiqiang@mail.com>

pkgname=polipo-git
pkgver=20130123
pkgrel=1
pkgdesc="A caching web proxy"
arch=('i686' 'x86_64')
url="http://www.pps.jussieu.fr/~jch/software/polipo/"
license=('custom')
depends=('glibc' 'bash')
makedepends=('git' 'texinfo')
provides=('polipo')
conflicts=()
source=('polipo.service')
md5sums=('c3551ef4d77bd8b133a98b4bb753531b')

_gitroot=https://github.com/jech/polipo.git
_gitname=polipo

_dest=/opt/github.com/polipo
_make_opts="PREFIX=$_dest LOCAL_ROOT=$_dest/share/polipo/www"

_checkout() {
  msg "Connecting to GIT server...."
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done"
}

build() {
  _checkout
  msg "Starting build..."

  rm -rf $srcdir/$_gitname-build
  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build
  make TARGET=$pkgdir $_make_opts install
}

package() {
  cd $srcdir/$_gitname-build
  mkdir -p $pkgdir/usr/local/bin
  ln -nsf $_dest/bin/polipo $pkgdir/usr/local/bin/

  install -Dm 644 config.sample $pkgdir/$_dest/etc/polipo/config.sample
  install -Dm 644 forbidden.sample $pkgdir/$_dest/etc/polipo/forbidden.sample

  install -Dm 644 $srcdir/polipo.service $pkgdir/$_dest/etc/systemd/system/polipo.service
}

