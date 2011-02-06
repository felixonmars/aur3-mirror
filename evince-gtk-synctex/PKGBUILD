# Contributor: Thomas Lundgaard <thomaslundgaard at gmail dot com>
# Initial PKGBUILD from http://bbs.archlinux.org/viewtopic.php?pid=621606 (thanks to Tristero)

# To change which editor to sync to, change the EDITOR variable in
# build().  This editor is used as the '-x' argument to the synctex
# CLI-tool, so see "synctex help edit" for info on the syntax and
# possible options
# If you work out EDITOR-options for another editor,
# add them in the comments on aur.archlinux.org, and I will add it to
# the list of commented-out EDITORs.

# You need to compile your tex files with pdflatex and use the
# argument --synctex=1.  To go from evince to the selected editor,
# doubleclick anywhere in the PDF in evince.  To go from your editor
# to evince, you can use some of the scripts avaliable from:
# http://aur.archlinux.org/packages/evince-gtk-synctex/evince-gtk-synctex
# See the comments in the top of the scripts for info on how to use
# them.

pkgname=evince-gtk-synctex
pkgver=2.26.2
pkgrel=3
pkgdesc="The Evince documentviewer patched to have no gnome deps + inverse and forward search with SyncTex, options to sync to emacs, gvim or kile (edit PKGBUILD to choose editor)"
url="http://www.gnome.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gsfonts' 'poppler-glib>=0.10.7' 't1lib' 'libdjvu>=3.5.20' 'desktop-file-utils' 'libspectre>=0.2.2' 'hicolor-icon-theme' 'gtk2' 'texlive-bin')
makedepends=('pkgconfig' 'texlive-bin' 'intltool' 'gnome-doc-utils')
optdepends=('texlive-bin: DVI support')
replaces=('gpdf')
provides=('evince')
conflicts=('evince')
install=evince-gtk-synctex.install
options=('!libtool' '!emptydirs')
source=("http://ftp.gnome.org/pub/gnome/sources/evince/2.26/evince-${pkgver}.tar.bz2"
        "evince-${pkgver}-gtk.patch"
        "evince-${pkgver}-synctex.patch")
md5sums=('ed8b9fb5c5d6feafd19f0114b736c9ef'
         '2e999966461e731206b03644bce5d52d'
         'a46c330a9b7ebf74f2dc4279bbbd7bb4')

build() {
  # Emacs
  EDITOR="sh -c 'cd $(dirname %{output}); emacs +%{line} %{input}'"
  # Emacsclient, great if you do not want multiple emacs windows. (thanks to haarward)
  # This requires (server-start) in .emacs, and 'export ALTERNATE_EDITOR="emacs"' in .bashrc
  #EDITOR="sh -c 'cd $(dirname %{output}); emacsclient -n +%{line} %{input}'"
  # Gvim
  #EDITOR="sh -c 'cd $(dirname %{output}); gvim --servername EVINCE --remote-silent +%{line} %{input}'
  # Kile
  #EDITOR="sh -c 'cd $(dirname %{output}); kile --line %{line} %{input}'"

  cd "${srcdir}/evince-${pkgver}"
  patch -Np0 -i ../evince-${pkgver}-gtk.patch || return 1
  patch -Np0 -i ../evince-${pkgver}-synctex.patch || return 1
  sed -i "s/SED_SYNCTEX_EDITOR/$EDITOR/g" libview/ev-view.c

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
          --enable-pdf --enable-dvi \
          --enable-djvu --enable-tiff \
          --enable-t1lib --enable-pixbuf \
          --enable-comics --enable-impress \
              --without-gconf --without-keyring \
              --disable-static --disable-schemas-install \
              --disable-scrollkeeper \
              || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}