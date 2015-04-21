# Maintainer: Kuredant <kuredant[at]gmail[dot]com>
# Original contributor: Michael Fellinger <m.fellinger@gmail.com>
# Updated by:
# Tapio Saarinen <admin@bitlong.org>
# Steve Klabnik <steve@steveklabnik.com>
# Michael Fellinger <m.fellinger@gmail.com>

pkgname=shoes-git
_gitname=shoes
pkgver=3.0.0.324.gd14b041
pkgrel=1
pkgdesc="The best little GUI toolkit, for Ruby."
url="http://shoesrb.com/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('ruby' 'giflib' 'gtk2' 'curl' 'portaudio' 'sqlite' 'tcl' 'tk'
         'java-environment')
makedepends=('git')
conflicts=('shoes')
provides=('shoes')
source=("git://github.com/${_gitname}/${_gitname}.git"
        "shoes.desktop")
sha256sums=('SKIP'
            'b26df7959e23a1b8e600993cd60ecf7cf43680fd7d88b4fcb1f6562633aa93c6')

pkgver() {
  cd "${srcdir}/${_gitname}"

  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "${srcdir}/${_gitname}"

  # Psych::ENGINE doesn't exist anymore in Ruby 2.2
  # Since Psych and YAML are the same namespace, YAML::ENGINE.yamler = 'syck'
  # fails.
  sed -i '/^YAML::ENGINE/d' "Rakefile" "lib/shoes/shy.rb"

  sed -i 's/DGifOpenFileName(filename)/DGifOpenFileName(filename, NULL)/' "shoes/image.c"
  # API changed for DGifCloseFile:
  # http://sourceforge.net/p/giflib/code/ci/116179a7d4681dda9afcdd43b5fbfb391b44918b/tree/doc/gif_lib.xml?diff=8408b09b69e5ce836d01a29e05c626ffa55cffaa
  sed -i 's/DGifCloseFile(gif)/DGifCloseFile(gif, D_GIF_SUCCEEDED)/' "shoes/image.c"

  # Use the new rb_fd_* API to get autosized fd_sets, since the old method is
  # not available anymore in Ruby 2.2
  sed -i 's/fd_set\ /rb_fdset_t\ /' "shoes/native/gtk.c"
  sed -i 's/FD_ZERO\ /rb_fd_init/' "shoes/native/gtk.c"
  sed -i 's/FD_SET\ /rb_fd_set/' "shoes/native/gtk.c"
  sed -i 's/FD_ISSET\ /rb_fd_isset/' "shoes/native/gtk.c"
  sed -i 's/rb_thread_select/rb_thread_fd_select/' "shoes/native/gtk.c"

  sed -i 's/LINUX_LIB_NAMES = %W\[#{RUBY_SO} cairo pangocairo-1.0 ungif\]/LINUX_LIB_NAMES = %W\[#{RUBY_SO} cairo pangocairo-1.0 gif\]/' "make/linux/env.rb"
  sed -i 's/if RTEST(rb_funcall(klass, i_json_creatable_p, 0))/if (RTEST(rb_funcall(klass, i_json_creatable_p, 0)))/' "req/json/ext/parser/parser.c"
  sed -i 's/defined(RUBY_2_1)/defined(RUBY_2_1) || defined(RUBY_2_2)/' "req/binject/ext/binject_c/binject.c"
}

build() {
  cd "${srcdir}/${_gitname}"

  rake clean && rake
}

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/"{"bin","lib/${_gitname}"}

  find "${_gitname}/dist" -mindepth 1 -maxdepth 1 \
      -and -exec cp -a {} "${pkgdir}/usr/lib/${_gitname}/" \;

  ln -sf "/usr/lib/${_gitname}/${_gitname}" "${pkgdir}/usr/bin/${_gitname}"

  install -Dm644 "${_gitname}/dist/static/app-icon.png"\
      "${pkgdir}/usr/share/pixmaps/${_gitname}.png"
  install -Dm644 "${_gitname}/COPYING" \
      "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_gitname}.desktop" \
    "${pkgdir}/usr/share/applications/${_gitname}.desktop"
}

# vim:set ts=2 sw=2 et:

