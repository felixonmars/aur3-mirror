# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=rxvt-unicode-patched-noinc-vteclear
_pkgname=rxvt-unicode
pkgver=9.20
pkgrel=1
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt) with fixed font spacing and clear patched to behave like VTEs (keep all lines).'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('libxft' 'gdk-pixbuf2' 'perl' 'startup-notification')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
source=(http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2
        font-width-fix.patch
        line-spacing-fix.patch
        noinc.diff
        popup-menu-hang.diff
        clear.patch)
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)

build() {
  cd $_pkgname-$pkgver
  patch -p0 -i ../font-width-fix.patch
  patch -p0 -i ../line-spacing-fix.patch
  patch -p0 -i ../popup-menu-hang.diff
  patch -p1 -i ../noinc.diff
  patch -p1 -i ../clear.patch
  ./configure \
    --prefix=/usr \
    --with-terminfo=/usr/share/terminfo \
    --enable-256-color \
    --enable-combining \
    --enable-fading \
    --enable-font-styles \
    --enable-iso14755 \
    --enable-keepscrolling \
    --enable-lastlog \
    --enable-mousewheel \
    --enable-next-scroll \
    --enable-perl \
    --enable-pixbuf \
    --enable-pointer-blank \
    --enable-rxvt-scroll \
    --enable-selectionscrolling \
    --enable-slipwheeling \
    --enable-smart-resize \
    --enable-startup-notification \
    --enable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-xterm-scroll \
    --disable-frills
  make
}

package() {
  pushd $_pkgname-$pkgver
  # workaround terminfo installation
  export TERMINFO="$pkgdir/usr/share/terminfo"
  install -d "$TERMINFO"
  make DESTDIR="$pkgdir" install
  # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"
  popd
}

md5sums=('4a5b823f08d21036f94a6c51e94d025b'
         'df0c3a8b6bb0578d1b91e4081c47881c'
         'd4e03127a0d3bbf2e173850770651b08'
         '1c85de8253b3a9002fabaaaccbdb51de'
         'aead33ba3b08eeb251fb0c1427a4a024'
         '061b851e89e53a71d1afad6947c51ca7')
