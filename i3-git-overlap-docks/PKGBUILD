# Contributor: Nikhilesh S (nikki) <s.nikhilesh@gmail.com>

# based on i3-git (http://aur.archlinux.org/packages.php?ID=24665)

pkgname=i3-git-overlap-docks
pkgver=20110505
pkgrel=1
pkgdesc="An improved dynamic tiling window manager (overlapping dock patch for stalonetray etc.)."
arch=('i686' 'x86_64')
url="http://i3.zekjur.net/"
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm', 'i3-git')
depends=('xcb-util' 'libx11' 'libev' 'yajl')
makedepends=('git' 'asciidoc' 'docbook-xsl' 'pkgconfig'
             'bison' 'flex')
optdepends=('rxvt-unicode: The terminal emulator used in the default config.'
            'dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display systeminformation with a bar.')
options=('docs' '!strip')

source=('i3-overlap-docks.patch')
md5sums=('7a25f5dbe2846387cbcf5900f7ada2ab')

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
    git branch -f next origin/next
    git checkout next

    git apply $srcdir/i3-overlap-docks.patch

    git commit -am "Overlap docks patch (by nikki)."
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make || return 1
  make -C man || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install || return 1

  install -Dm644 man/i3.1 \
    ${pkgdir}/usr/share/man/man1/i3.1 || return 1
  install -Dm644 man/i3-msg.1 \
    ${pkgdir}/usr/share/man/man1/i3-msg.1 || return 1
  install -Dm644 man/i3-input.1 \
    ${pkgdir}/usr/share/man/man1/i3-input.1 || return 1

  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
 
  rm ${pkgdir}/usr/bin/i3-wsbar || return 1

  make clean
}

# vim:set ts=2 sw=2 et:

