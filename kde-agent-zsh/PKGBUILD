# Maintainer: Etienne Perot <etienne[at]perot[dot]me>

pkgname=kde-agent-zsh
pkgver=20121218
pkgrel=2
pkgdesc="Use ZSH environment variables to determine which SSH/GPG agent to use in KDE applications."
arch=('any')
url='https://github.com/EtiennePerot/kde-agent-zsh'
license=('WTFPL')
provides=('kde-agent')
conflicts=('kde-agent')
depends=('pinentry' 'openssh' 'qt4')
source=('gpg-ssh-agent.sh'
        'gpg-ssh-agent-shutdown.sh')
sha512sums=('518b57aa29ee52a3bd059f63c661edce6864d8a95b9cfec14eb8ee537184492805de06225ab6d64cf225b847e2619fa2e2379d37987e04b99878bf93f96cf427'
            'a63619823bd235d9450badc0d083fb8d38b252d28230c49233dbda5a33bf5863a7844ea48afa38643b0d0edce54aa4508aa45ac932a3f2d86ccc6af39464807a')
package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/etc/kde/env
  install -D -m755 gpg-ssh-agent.sh "${pkgdir}"/etc/kde/env/

  install -d "${pkgdir}"/etc/kde/shutdown
  install -D -m755 gpg-ssh-agent-shutdown.sh "${pkgdir}"/etc/kde/shutdown/
}
