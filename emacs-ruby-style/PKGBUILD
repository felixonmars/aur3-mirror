# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=emacs-ruby-style
pkgver=2.0.0.rc2
pkgrel=1
pkgdesc="Emacs ruby style plugin"
arch=(any)
url=http://ruby-lang.org
license=(BSD)
depends=(emacs)
source=(http://svn.ruby-lang.org/repos/ruby/tags/v${pkgver//./_}/misc/ruby-style.el
    http://svn.ruby-lang.org/repos/ruby/tags/v${pkgver//./_}/BSDL)
sha256sums=('8cdd9c3681c505dfd8f8b5fb623bf96ad8600b5f2277c56eeaa12ee28b6e6885'
    'fd1b599acac68b469a5a8e1f86db438808845e821f185dd728ab39b6eadfc717')
sha512sums=('401a2e5e33b447ced456ac61a32ea9aa475b598c4c229ce70f9587ecf5fcef20ef65d77e85bd653360554a4dc66d94c2c84fdb2eb1a2461250715c2ce203906d'
    '752e180b4f58e6e0e8e774879b689982fcd4fc26124d5fba299f5d8593b3bf57b7a67ffa2543b63f5ac055f6071ce8594a8eea2e1db6043388c6ffeb415d30f9')

package() {
    install -Dm644 ruby-style.el "$pkgdir"/usr/share/emacs/site-lisp/ruby-style/ruby-style.el
    install -Dm644 BSDL "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
