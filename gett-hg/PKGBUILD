# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=gett-hg
pkgver=57.0f2f388956c0
pkgrel=3
pkgdesc="Simple command-line interface to the ge.tt file sharing website. You can use it to upload files, list and create shares and delete those."
arch=(any)
url=http://ge.tt/tools
license=(LGPL)
depends=(python3)
makedepends=(mercurial python3)
provides=(gett)
conflicts=(gett)

source=("$pkgname::hg+https://bitbucket.org/mickael9/gett-cli")
md5sums=('SKIP')

pkgver(){
  cd $pkgname
  echo $(hg identify -n).$(hg identify -i)
}

package(){
  cd "$srcdir/$pkgname"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
