# Maintainer: xduugu
pkgname=perf-git
pkgver=20091102
pkgrel=1
pkgdesc="Performance analysis tools for Linux"
url="http://www.kernel.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libelf')
makedepends=('asciidoc' 'docbook-xsl' 'xmlto')
provides=("perf=$pkgver")
conflicts=('perf')

_gitroot="http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob_plain;hb=HEAD;f"
_gitname="unnamed"

_download_files() {
    _filename="$1"
    _url="$2"

    # work around gitweb generation time
    while [ -z "$(echo '<!DOCTYPE ' | cat "$_filename" - 2>/dev/null \
                  | head -1 | grep -v '^<!DOCTYPE ')" ]
    do
      wget -nv -O "$_filename" "$_url" || return 1
      [[ ${_filename} = *.tar.gz ]] && bsdtar tf &>/dev/null || true
    done
}


build() {
  rm -rf "$srcdir/"*

  install -d arch/x86/include/asm include/linux lib tools || return 1

  msg "Fetching Sources from git.kernel.org..."
  warning "Makepkg is very likely to fail on the first run due to gitweb's snapshot generation time."
  warning "Just wait some seconds and run makepkg again."

  _download_files "perf.tar.gz" \
    "http://git.kernel.org$(wget -qO - 'http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=tree;f=tools/perf;hb=HEAD' \
                             | grep -oP '[^"]+;a=snapshot;h=[^"]+')" &&
  bsdtar xf perf.tar.gz &&
  mv linux-2.6 tools/perf || return 1

  for _file in arch/x86/include/asm/{unistd_32,unistd_64,unistd}.h \
              include/linux/{list,magic,perf_event,poison,rbtree}.h \
              lib/rbtree.c
  do
      _download_files "$_file" "$_gitroot=$_file" || return 1
  done

  msg "Starting build..."
  cd tools/perf &&
  sed -i 's|^prefix = \$(HOME)$|prefix = /usr|' Makefile &&
  make perf man || return 1 
}

package() {
  make -C "$srcdir/tools/perf" DESTDIR="$pkgdir" \
    install install-man || return 1
}

# vim:set ts=2 sw=2 et:
