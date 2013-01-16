# Maintainer: Your Name <tim(dot)schmitz2(at)rwth-aachen(dot)de>
pkgname=syncmyl2p-git
pkgver=20130110
pkgrel=1
pkgdesc="Sync the L2P of the RWTH Aachen with your Computer"
arch=('i686' 'x86_64')
url="https://github.com/Sync-my-L2P/Sync-my-L2P"
license=('GPL')
groups=()
depends=('qt')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='syncmyl2p-git.install'
source=(
syncmyl2p-git.desktop
PositiveSSLCA.der
www2.elearning.rwth-aachen.de.der
UTN-USERFirst-Hardware.der
)

noextract=()
md5sums=('4258c14450411fcae53102e2ae913dae'
         'deaa8dd60057f5bd4c42e12eee9b41dd'
         '1268b06c045b7740cc52a46d8665a1ce'
         '1cbc22074d3a3abb9da471d5f66dad45')

_gitroot=https://github.com/Sync-my-L2P/Sync-my-L2P.git
_gitname="Sync-My-L2P"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  cp "$srcdir/www2.elearning.rwth-aachen.de.der" "$srcdir/$_gitname-build/"
  cp "$srcdir/UTN-USERFirst-Hardware.der" "$srcdir/$_gitname-build/"
  cp "$srcdir/PositiveSSLCA.der" "$srcdir/$_gitname-build/" 
  qmake
  make
}

package() 
{
	cd ${srcdir}

	install -Dm644 ${pkgname}.desktop \
		${pkgdir}/usr/share/applications/${pkgname}.desktop

	install -dm755 ${pkgdir}/opt
	cp --preserve=mode -r "Sync-My-L2P" \
		${pkgdir}/opt/${pkgname}

	install -Dm755 "$srcdir/$_gitname-build/Sync-my-L2P" ${pkgdir}/usr/bin/l2p
}

# vim:set ts=2 sw=2 et:
