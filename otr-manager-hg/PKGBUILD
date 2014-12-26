# Maintainer: Whitie

pkgname=otr-manager-hg
pkgver=20141225
pkgrel=1
pkgdesc="GUI tool to manage recordings from onlinetvrecorder.com."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python-pyqt5' 'python-requests' 'python-setuptools' 'python-pyftpdlib' 'ffmpeg' 'ffms2' 'x264-ffms-git' 'mkvtoolnix-cli' 'mencoder' 'wget')
makedepends=('mercurial')
provides=('otr-manager')
conflicts=('otr-manager')
url="https://bitbucket.org/whitie/otr-manager/"
md5sums=('SKIP')

_hgroot="https://bitbucket.org/whitie/otr-manager"
_hgname='otr-manager'

build() {
  cd $srcdir
  msg "Connecting to Bitbucket..."
  
  if [ -d "$srcdir/${_hgname}/.hg" ]; then
    cd $_hgname && hg pull -u
    msg "Local files are updated."
  else
    hg clone $_hgroot $_hgname
  fi
  
  msg "Mercurial checkout finished or server timeout."
}

package() {
  cd $srcdir/$_hgname
  msg "Starting build process..."
  
  python setup.py install --root="$pkgdir" --prefix=/usr
  
  msg "Installing docs..."
  mkdir -p $pkgdir/usr/share/doc/$_hgname
  install -Dm644 README.rst $pkgdir/usr/share/doc/$_hgname/README.rst
}
