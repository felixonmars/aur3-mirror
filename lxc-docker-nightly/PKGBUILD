# Maintainer: Nicolas Dudebout <nicolas.dudebout@gatech.edu>
# Repository: https://github.com/dudebout/lxc-docker-nightly
pkgname=lxc-docker-nightly
pkgver=0.7.0rc4
pkgrel=1
pkgdesc='Docker: the Linux container engine'
arch=('x86_64')
url='http://www.docker.io'
license=('Apache')
# https://github.com/dotcloud/docker/blob/master/hack/PACKAGERS.md#runtime-dependencies
depends=('tar>=1.26'
         'iproute2>=3.5'
         'iptables>=1.4'
         'lxc>=0.8'
         'git>=1.7'
         'xz>=4.9')
provides=('lxc-docker-nightly')
conflicts=('lxc-docker' 'lxc-docker-git')
backup=('etc/sysctl.d/docker.conf')
install='docker.install'
changelog='ChangeLog.docker'
# See https://test.docker.io/ubuntu/dists/docker/main/binary-amd64/Packages for a list of available binaries
source=("docker::http://test.docker.io/builds/Linux/$arch/docker-0.7.0-rc4"
        'https://raw.github.com/dotcloud/docker/master/contrib/init/systemd/docker.service'
        'docker.sysctl'
        'docker.bash::https://raw.github.com/dotcloud/docker/master/contrib/completion/bash/docker'
        'docker.zsh::https://raw.github.com/dotcloud/docker/master/contrib/completion/zsh/_docker')
sha512sums=('eced0cb531a3c000c96792b9f7294eb22e0ffcedb26c13e347addae794e2f797a08825fa66740f6da3e9c1b2e16bf920ea8849c6684a73ba415d18a585685010'
            'd239bdbec4567fe2deba12c65647e7eba32f3e1258b3048897de37ad78ca271d19c31473928187edf52bd2a58ae71cef6427abe434c98ea2c872f2579099edb3'
            '8e09f5c0bda88f52a3497dc28d0193d8ba598e9db246c576cf4902abe5653ce66f942446e4d433f27b637fdcd0bccf322c2b2c9defbd978236859e6027798c7f'
            'c4e5400657b4ff6243c882f04452c972f95078feec74bfb6ea6bd6aa57e622550f53e33b23febbe67be0e4fb688be218015d4ec99fd69472fa031c5f75af57fc'
            '0a4f82a6f9aaa4520ecde3946545400d9f206fd81bd55f520a198be6f607bc54f6736d6c9d0e3684cb6f1b97f256d151950551c1db48375dc646ef26ef1e126d')

package() {
  install -D -m 755 "$srcdir/docker" "$pkgdir/usr/bin/docker"
  install -D -m 644 "$srcdir/docker.service" "$pkgdir/usr/lib/systemd/system/docker.service"
  install -D -m 644 "docker.sysctl" "$pkgdir/etc/sysctl.d/docker.conf"
  install -D -m 644 "$srcdir/docker.bash" "$pkgdir/usr/share/bash-completion/completions/docker"
  install -D -m 644 "$srcdir/docker.zsh" "$pkgdir/usr/share/zsh/site-functions/_docker"
}
