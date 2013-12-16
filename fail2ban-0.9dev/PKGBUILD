# $Id: PKGBUILD 101230 2013-11-20 09:36:13Z bpiotrowski $
# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: michalzxc
# Contributor: nbags <neilbags@gmail.com>

pkgname=fail2ban-0.9dev
pkgver=0.9.0a2
pkgrel=2
pkgdesc='Bans IPs after too many failed authentication attempts against common daemons'
url='http://www.fail2ban.org/'
license=('GPL')
arch=('any')
depends=('python' 'iptables' 'systemd')
conflicts=('fail2ban')
backup=(etc/fail2ban/fail2ban.conf
        etc/fail2ban/jail.conf)
install=fail2ban.install
source=(https://github.com/fail2ban/fail2ban/archive/$pkgver.tar.gz
        service tmpfiles.conf)
sha256sums=('c1341f5032b69f57586fcb21ba2505ecd509ee24e31d24b49a568f196a321e2e'
            '1bce54ad435b7dd3547baceea050a1d66745010b28a4ded269f6707cebdc99b1'
            'ce8922c4734a56c88f22ffa4f2ad5819d113c7d4e439b142c984816599ebc1f4')

package() {
  cd fail2ban-$pkgver
  python setup.py install --root "$pkgdir"

  install -Dm644 files/fail2ban.service \
          "$pkgdir"/usr/lib/systemd/system/fail2ban.service
  install -Dm644 files/fail2ban-tmpfiles.conf \
          "$pkgdir"/usr/lib/tmpfiles.d/fail2ban.conf
  install -Dm644 files/bash-completion \
          "$pkgdir"/usr/share/bash-completion/completions/fail2ban

  # avoid conflict with filesystem>=2012.06
  rm -r "$pkgdir"/var/run

  # fix sendmail location
  sed -i 's/sbin/bin/g' "$pkgdir"/etc/fail2ban/action.d/sendmail*.conf

  install -Dm644 man/fail2ban.1 "$pkgdir"/usr/share/man/man1/fail2ban.1
  install -Dm644 man/fail2ban-client.1 \
          "$pkgdir"/usr/share/man/man1/fail2ban-client.1
  install -Dm644 man/fail2ban-regex.1 \
          "$pkgdir"/usr/share/man/man1/fail2ban-regex.1
  install -Dm644 man/fail2ban-server.1 \
          "$pkgdir"/usr/share/man/man1/fail2ban-server.1
  install -Dm644 man/jail.conf.5 "$pkgdir"/usr/share/man/man5/jail.conf.5
}
