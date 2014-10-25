# Maintainer: foalsrock <foalsrock at gmail dot-com>

pkgname=fzf-git
pkgver=0.8.7.r12.g6fd6fff
pkgrel=1
pkgdesc="Fuzzy finder for your shell"
arch=(any)
url="https://github.com/junegunn/fzf"
license=('MIT')
depends=('ruby>=1.8.5' 'ruby-curses')
md5sums=('SKIP')
source=("git://github.com/junegunn/fzf"
        "fzf.sh")
md5sums=('SKIP'
         '4d1812d8f1a6055213e3046344ee239c')

pkgver() {
  cd "${srcdir}/fzf"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  install -Dm755 "${srcdir}/fzf/fzf" "${pkgdir}/usr/bin/fzf"

  # Optional stuff below- uncomment as suited

  # BASH completion
  #install -Dm644 "${srcdir}/fzf/fzf-completion.bash" \
    #"${pkgdir}/usr/share/bash-completion/completions/fzf"

  # useful shell functions- tested with BASH only, *may* work in other shells
  # install -Dm755 "${srcdir}/fzf.sh" "${pkgdir}/etc/profile.d/fzf.sh"

  # vim plugin
  #install -Dm755 "${srcdir}/fzf/plugin/fzf.vim" \
    #"${pkgdir}/usr/share/vim/vimfiles/plugin/fzf.vim"
}
