# Maintainer: Philfifi <philfifi@gmail.com>

pkgname=pykmaze-git
pkgver=20120909
pkgrel=1
pkgdesc="Geonaute Keymaze 500/700 GPS watch device communicator"
arch=('any')
url="https://github.com/eblot/pykmaze"
license=('MIT')
depends=('python2' 'python2-pyserial')

_gitroot='git://github.com/eblot/pykmaze.git'
_gitname='pykmaze'
_gitbranch='master'


build() {
 cd "$srcdir"
 msg "Connecting to GIT server...."
 if [ -d $_gitname ] ; then
   cd $_gitname && git pull origin
   msg "The local files are updated."
 else
   git clone $_gitroot $_gitname
 fi
 msg "GIT checkout done or server timeout"

rm -rf "$srcdir/$_gitname-build"
git clone --depth=1 "$srcdir/$_gitname" "$srcdir/$_gitname-build"
cd "$srcdir/$_gitname-build"


  yes | python2 setup.py build
}

package() {
  cd "${srcdir}/$_gitname-build"
  yes | python2 setup.py install --root="${pkgdir}"   --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
