# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=termkit-git
pkgver=20121206
pkgrel=1
pkgdesc="A shell (server) implemented in WebKit"
arch=('i686' 'x86_64')
url="https://github.com/Floby/TermKit"
license=('custom')
depends=('nodejs')
install='npm.install'
makedepends=('git')
provides=('termkit-server')

_gitroot=('git://github.com/Floby/TermKit.git')
_gitname=('TermKit')

build() {
 cd $srcdir

msg "pulling TermKit"
 cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull $_gitroot
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
}

package() {
msg "installing TermKit"

mkdir -p $pkgdir/usr/lib
cp -ar $srcdir/$_gitname $pkgdir/usr/lib/$_gitname
chmod -R 755 $pkgdir/usr/lib/$_gitname
mkdir -p $pkgdir/usr/share/licenses/$_gitname/
install -m644 $srcdir/$_gitname/License.txt $pkgdir/usr/share/licenses/$_gitname/LICENSE
}
