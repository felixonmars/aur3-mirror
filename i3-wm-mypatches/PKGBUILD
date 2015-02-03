pkgname=i3-wm-mypatches
_pkgsourcename=i3
pkgver=4.8
pkgrel=3
pkgdesc='An improved dynamic tiling window manager (with my patches)'
arch=('i686' 'x86_64')
url='http://i3wm.org/'
license=('BSD')
replaces=('i3' 'i3bar')
provides=('i3-wm')
conflicts=('i3-wm')
groups=('i3')
depends=('xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango')
makedepends=('bison' 'flex')
optdepends=('dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display systeminformation with a bar.'
            'perl-anyevent-i3: Features like saving the layout.'
            'perl-json-xs: Features like saving the layout.')
options=('docs' '!strip')
source=("http://i3wm.org/downloads/${_pkgsourcename}-${pkgver}.tar.bz2"
        'bugfix_dont_focus_unmapped_container_on_manage.patch'
        '0001-add-setting-decoration-colors-for-specific-windows.patch'
        '0001-Support-_NET_WM_MOVERESIZE.patch'
        )
md5sums=('4151e8e81fdc78b32a7cb953f67e3bef'
         '2601c1d3fa5e45bc637a82486fdc5be6'
         '845b212ecdbcb935574248982c9906d4'
         '41f761d5fd7373f617a6954c80063358')

build() {
  cd "$srcdir/$_pkgsourcename-$pkgver"
  
  patch -p1 < "$srcdir/bugfix_dont_focus_unmapped_container_on_manage.patch"
  patch -p1 < "$srcdir/0001-add-setting-decoration-colors-for-specific-windows.patch"
  patch -p1 < "$srcdir/0001-Support-_NET_WM_MOVERESIZE.patch"
  # In order to avoid problems with bison use only a single process
  MAKEFLAGS="-j1"
  make
}

package() {
  cd "$srcdir/$_pkgsourcename-$pkgver"

  make DESTDIR="$pkgdir/" install
  
  install -Dm644 man/i3.1 \
    ${pkgdir}/usr/share/man/man1/i3.1
  install -Dm644 man/i3bar.1 \
    ${pkgdir}/usr/share/man/man1/i3bar.1
  install -Dm644 man/i3-config-wizard.1 \
    ${pkgdir}/usr/share/man/man1/i3-config-wizard.1
  install -Dm644 man/i3-input.1 \
    ${pkgdir}/usr/share/man/man1/i3-input.1
  install -Dm644 man/i3-msg.1 \
    ${pkgdir}/usr/share/man/man1/i3-msg.1
  install -Dm644 man/i3-migrate-config-to-v4.1 \
    ${pkgdir}/usr/share/man/man1/i3-migrate-config-to-v4.1
  install -Dm644 man/i3-nagbar.1 \
    ${pkgdir}/usr/share/man/man1/i3-nagbar.1
  install -Dm644 man/i3-dmenu-desktop.1 \
    ${pkgdir}/usr/share/man/man1/i3-dmenu-desktop.1
  install -Dm644 man/i3-dump-log.1 \
    ${pkgdir}/usr/share/man/man1/i3-dump-log.1
  install -Dm644 man/i3-sensible-editor.1 \
    ${pkgdir}/usr/share/man/man1/i3-sensible-editor.1
  install -Dm644 man/i3-sensible-pager.1 \
    ${pkgdir}/usr/share/man/man1/i3-sensible-pager.1
  install -Dm644 man/i3-sensible-terminal.1 \
    ${pkgdir}/usr/share/man/man1/i3-sensible-terminal.1

  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  
  make clean
}

# vim:set ts=2 sw=2 et:
