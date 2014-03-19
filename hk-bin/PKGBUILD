# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>

pkgname=hk-bin
pkgver=20140314
pkgrel=1
pkgdesc="Fast Heroku Client"
arch=('x86_64' 'i686')
url="https://github.com/heroku/hk"
license=('MIT')
makedepends=('go' 'mercurial')
depends=('glibc')
optdepends=('bash' 'zsh')
source=("https://hk.heroku.com/hk.gz"
        "https://raw.github.com/heroku/hk/master/LICENSE"
        "https://raw.github.com/heroku/hk/master/contrib/hk-bash-completion.sh"
        "https://raw.github.com/heroku/hk/master/contrib/hk-zsh-completion.sh")
md5sums=('6aa6afd0fba5e7e6d5713e190190d653'
         '6aaeb8a9f046a7c13f20827d641f1e15'
         '2afe1282484c9cd6dc932b5285748848'
         'c5c37c410f4c810a541b6c1c37f6dfb8')

prepare() {
  #Nothing to prepare
  echo "Nothing to prepare"
}

build() {
  #Nothing to build
  echo "Nothing to build"
}


package() {
  cd $srcdir
  install -Dm755 "hk" "${pkgdir}/usr/bin/hk"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/hk-bin/LICENSE"
  install -Dm644 "hk-bash-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/hk"
  install -Dm644 "hk-zsh-completion.sh" "${pkgdir}/usr/share/zsh/site-functions/_hk"
}



