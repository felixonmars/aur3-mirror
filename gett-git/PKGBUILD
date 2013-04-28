# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=gett-git
pkgver=20130118
pkgrel=1
pkgdesc="Simple command-line interface to the ge.tt file sharing website. You can use it to upload files, list and create shares and delete those."
arch=(any)
url=http://ge.tt/tools
license=(LGPL)
depends=(python3)
makedepends=('mercurial')
provides=(gett)
conflicts=(gett)
options=(!emptydirs)

_hgroot=https://bitbucket.org/mickael9/gett-cli
_hgrepo=gett-cli

build(){
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
}

package(){
  cd "$srcdir/$_hgrepo"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
