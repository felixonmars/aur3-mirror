# Maintainer: Nicolas Dudebout <nicolas.dudebout@gatech.edu>
# Repository: https://github.com/dudebout/lxc-docker-nightly
pkgname=lxc-docker-nightly
pkgver=0.7.0rc5
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
source=("docker::http://test.docker.io/builds/Linux/$arch/docker-0.7.0-rc5"
        'https://raw.github.com/dotcloud/docker/master/contrib/init/systemd/docker.service'
        'docker.sysctl'
        'docker.bash::https://raw.github.com/dotcloud/docker/master/contrib/completion/bash/docker'
        'docker.zsh::https://raw.github.com/dotcloud/docker/master/contrib/completion/zsh/_docker')
sha512sums=('2de7e2bb7ed661bd574e23be06cad0cfc05dc01aa894e519b84394de0d7399436d785a07af640368795dad5876078f9b1f1e05abd9c54df60b5b300f71754429'
            '74dd6d942c8284408955c5b9878f32ebb610b4b00dd1a1b502fa1421076f16552a00dd828fdfddc53b797032409443e9a6a77494d53b534d81176c26dc15d43a'
            '8e09f5c0bda88f52a3497dc28d0193d8ba598e9db246c576cf4902abe5653ce66f942446e4d433f27b637fdcd0bccf322c2b2c9defbd978236859e6027798c7f'
            '614bc37c646a3404c91e72897083ae9e4f8aca63f761b7d7e94fe029ca8bbc2c7e2f29379e55f84fa470e978bd997632621d46615a45a24fa4675ab9cdfb1888'
            '0a4f82a6f9aaa4520ecde3946545400d9f206fd81bd55f520a198be6f607bc54f6736d6c9d0e3684cb6f1b97f256d151950551c1db48375dc646ef26ef1e126d')

package() {
  install -D -m 755 "$srcdir/docker" "$pkgdir/usr/bin/docker"
  install -D -m 644 "$srcdir/docker.service" "$pkgdir/usr/lib/systemd/system/docker.service"
  install -D -m 644 "docker.sysctl" "$pkgdir/etc/sysctl.d/docker.conf"
  install -D -m 644 "$srcdir/docker.bash" "$pkgdir/usr/share/bash-completion/completions/docker"
  install -D -m 644 "$srcdir/docker.zsh" "$pkgdir/usr/share/zsh/site-functions/_docker"
}
