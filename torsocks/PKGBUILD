# Maintainer: Nicolas Pouillard >nicolas.pouillard@gmail.com>
# Contributor: Rorschach <r0rschach@lavabit.com>

pkgname=torsocks
pkgver=1.3
pkgrel=2
pkgdesc="Allows you to use most socks-friendly applications in a safe way with Tor."
arch=('i686' 'x86_64')
url="http://code.google.com/p/torsocks"
license=('GPL2')
optdepends=('tor')
makedepends=('patch' 'rsync')
backup=("etc/${pkgname}.conf")
conflicts=(torsocks-git)

_gitremote=https://git.torproject.org
_gitrepo=torsocks
_gitbranch=${pkgver}

build() {
  cd "$srcdir"

  if [[ -d "$srcdir"/$_gitrepo/.git ]]
  then
    cd $_gitrepo
    git fetch origin
    git reset --hard origin/master
    msg "The local files are updated."
  else
    git clone $_gitremote/$_gitrepo
  fi
  cd "$srcdir"/$_gitrepo
  git checkout $_gitbranch
  rsync -aH --del "$srcdir"/$_gitrepo/ "$srcdir"/build/
  cd "$srcdir"/build
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}
