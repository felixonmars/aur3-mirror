# Maintainer:Bjoern Bidar <theodorstormgrade@gmail.com>
pkgname=firefox-extention-kwallet-git
pkgver=20120703
pkgrel=1
pkgdesc="This is an extension that allows firefox use kde's kwallet password manager to store passwords."
arch=('i686' 'x86_64')
url="https://github.com/maciex/mozilla-kwallet"
license=('MPL 1.1' 'GPL 2.0' 'LGPL 2.1' )
depends=( 'qt' 'kdelibs' 'nspr' 'firefox>=13' 'xulrunner' 'kdeutils-kwallet'  )
makedepends=('git' 'cmake'  )


_git_root=https://github.com/maciex/mozilla-kwallet.git
_git_name=mozilla-kwallet

build() {
  cd "$srcdir"
  if [ -d "$_git_name" ] ; then
    cd "$_git_name"
    git pull origin
    cd ..
  else
    git clone "$_git_root"
  fi
  cd "$_git_name"
  make build_lib 
}



package() {
  cd $srcdir/$_git_name/xpi
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  dstdir=$pkgdir/usr/lib/firefox/extensions/${emid}
  install -d $dstdir
  mv * $dstdir
}