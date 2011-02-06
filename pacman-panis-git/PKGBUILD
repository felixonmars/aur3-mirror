# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: godane <slaxemulator@gmail.com.com>
# Contributor: Andres Perera <aepd87@gmail.com>

pkgname=pacman-panis-git
pkgver=20100702
pkgrel=1
pkgdesc="A library-based package manager with dependency support and optional panis progress bar"
arch=('i686' 'x86_64')
url='http://www.archlinux.org/pacman'
license=('GPL')
groups=('base')
depends=('bash' 'libarchive>=2.7.1' 'libfetch>=2.25' 'pacman-mirrorlist')
makedepends=('git' 'asciidoc')
optdepends=('fakeroot: for makepkg usage as normal user')
provides=('pacman')
conflicts=('pacman')
backup=('etc/pacman.conf' 'etc/makepkg.conf')
options=(!libtool)
install=pacman.install
source=('pacman.conf.diff')

_gitroot="git://projects.archlinux.org/pacman.git"
_gitpanis="git://github.com/joeDeuce/pacman-panis-patch"
_gitpanisname="pacman-panis-patch"
_gitname="pacman"

build() {
  msg 'Connecting to GIT server...'

  if [[ -d $_gitname ]]; then
    ( cd $_gitname && git pull origin )
    msg 'The local files are updated.'
  else
    git clone $_gitroot
  fi

  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  rm -rf $_gitpanisname
  rm -rf $_gitname-build
  git clone $_gitpanis
  git clone $_gitname{,-build}
  cd $_gitname-build
  msg "Patching panis."
  patch -d ./src/pacman < ../pacman-panis-patch/panis.patch || return 1
  msg "Patching panis was successful."

  ./autogen.sh
  ./configure \
    --enable-doc \
    --localstatedir=/var \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-pkg-ext=.pkg.tar.xz \
    #

  make

  patch -p0 < ../pacman.conf.diff
}

package() {
  cd $_gitname-build

  make DESTDIR=$pkgdir install

  install -Dm644 contrib/bash_completion $pkgdir/etc/bash_completion.d/pacman
  install -Dm644 contrib/zsh_completion  $pkgdir/usr/share/zsh/site-functions/_pacman
}

md5sums=('c1441f69eb8e9860dfb1f32303ccb1f7')
