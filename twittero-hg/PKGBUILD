# Contributor: Facundo M. de la Cruz <fmdlc@code4life.com.ar>

pkgname=twittero-hg
pkgver=0.1
pkgrel=1
pkgdesc="Twittero is a simple and powerful Twitter client for the POSIX terminal"
url="http://code.google.com/p/twittero-client/"
license=("BSD")
arch=("i686" "x86_64")
depends=("python>=2.6" "python-twitter")
makedepends=("mercurial")
_hgroot=https://twittero-client.googlecode.com/hg/
_hgrepo=twittero-client
md5sums=()

build() {
  cd ${srcdir}
  
  if [ -d ${_hgrepo} ]; then
    cd ${_hgrepo}
#    hg pull -u
  else
    hg clone ${_hgroot} ${_hgrepo}
    cd ${_hgrepo}
  fi
  
  msg "Starting build process."
  DSTDIR=$pkgdir/usr/share/twittero
  install -Dm0755 twittero $DSTDIR/twittero
  install -Dm0644 License.txt $DSTDIR/License.txt
  install -Dm0644 README.txt $DSTDIR/README.txt
  install -Dm0644 CHANGELOG.txt $DSTDIR/CHANGELOG.txt
  intalll -Dm0644 ToDo.txt $DSTDIR/ToDo.txt


  install -dm0755 $pkgdir/usr/bin
  ln -s /usr/share/twittero/twittero $pkgdir/usr/bin/twittero
}

