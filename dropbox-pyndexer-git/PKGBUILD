pkgname=dropbox-pyndexer-git
_realname=pyndexer
pkgver=20100615
pkgrel=1
pkgdesc="It's a html index generator for dropbox public folders"
arch=('any')
url="http://github.com/eliphaslevy/pyndexer"
license=('other')
depends=('python' 'dropbox')
makedepends=('git')
optdepends=('python-m2crypto: if you want encryption support')
source=('pyndexer-launcher')
install=pyndexer.install
md5sums=('33338145be7d95f964e1e7de2214d395')


_gitroot="git://github.com/eliphaslevy/pyndexer.git"
_gitname="pyndexer"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  

  install -Dm755 pyndexer.py $pkgdir/usr/share/pyndexer/pyndexer.py
  install -Dm655 README.txt  $pkgdir/usr/share/pyndexer/README.txt
  install -Dm655 README-FIRST.html $pkgdir/usr/share/pyndexer/README-FIRST.html
  
  cd $srcdir

  install -Dm755 pyndexer-launcher $pkgdir/usr/bin/pyndexer


} 
