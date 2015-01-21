# Maintainer: Miroslav Koskar (http://mkoskar.com/)

_basename='spring-boot-cli'

pkgname='spring-boot-cli-bin'
pkgver='1.2.1'
_pkgver="$pkgver.RELEASE"
pkgrel=1
pkgdesc='Spring Boot CLI'
url='http://docs.spring.io/spring-boot/docs/1.2.1.RELEASE/reference/html/getting-started-installing-spring-boot.html#getting-started-installing-the-cli'
license=('Apache')
arch=('any')
depends=('java-environment>=6')
provides=('spring-boot-cli')
conflicts=('spring-boot-cli')

source=("https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/$_pkgver/spring-boot-cli-$_pkgver-bin.tar.gz")
md5sums=('62860e941f3896097e7ccb9ab98ba965')

package() {
    cd "$srcdir/spring-$_pkgver"

    mkdir -p "$pkgdir/opt/$_basename"
    cp -a bin lib legal "$pkgdir/opt/$_basename"
    rm "$pkgdir/opt/$_basename/bin/spring.bat"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/$_basename/bin/spring" "$pkgdir/usr/bin/spring"

    install -D -m 644 shell-completion/bash/spring "$pkgdir/usr/share/bash-completion/completions/spring"
    install -D -m 644 shell-completion/zsh/_spring "$pkgdir/usr/share/zsh/site-functions/_spring"
}
