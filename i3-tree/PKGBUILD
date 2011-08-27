# Maintainer: Fabio Zanini <fabio.zanini@fastmail.fm>

pkgname=i3-tree
pkgver=20110403
pkgrel=1
pkgdesc="An improved dynamic tiling window manager. Tree branch."
arch=('i686' 'x86_64')
url="http://i3.zekjur.net/"
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm' 'i3-git')
depends=('xcb-util' 'libxcursor' 'libev' 'yajl')
makedepends=('git' 'asciidoc' 'docbook-xsl' 'pkgconfig'
             'bison' 'flex')
optdepends=('rxvt-unicode: The terminal emulator used in the default config.'
            'dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display systeminformation with a bar.')
options=('docs' '!strip')
install='i3-tree.install'

_gitroot="git://code.stapelberg.de/i3"
_gitname="i3"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    
    cd $_gitname
    git branch -f tree origin/tree
    git checkout tree
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # makepkg takes care of the || return 1 part
  make
  make -C man
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install

  install -Dm644 man/i3.1 \
    ${pkgdir}/usr/share/man/man1/i3.1
  install -Dm644 man/i3-msg.1 \
    ${pkgdir}/usr/share/man/man1/i3-msg.1
  install -Dm644 man/i3-input.1 \
    ${pkgdir}/usr/share/man/man1/i3-input.1

  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  make clean
}

# vim:set ts=2 sw=2 et:

