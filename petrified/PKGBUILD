# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname=petrified
pkgver=1.0.1
pkgrel=1
pkgdesc="Bash client to update dynamic DNS at freedns.afraid.org"
arch=('any')
url="https://github.com/troyengel/petrified"
license=('GPL3')
options=('emptydirs')
depends=('util-linux' 'coreutils' 'bash' 'iproute2' 'curl')
install=petrified.archinst
backup=('etc/petrified.conf')
source=('petrified'
        'petrified.conf'
        'petrified.crontab'
        'petrified.dispatch'
        'petrified.logrotate'
        'README.md'
        'LICENSE')
md5sums=('1bd8884a60ef9d56e1d8bab5febd9618'
         '3afaa609eaf5089d968167d5298aed31'
         '96748831c58c8b64e786a9f7386db22e'
         '01d6dd718325644c3bfbc89030d66a21'
         '66aff4c7c44404f32315abdab0a479bc'
         '56ab643013bdea713f0e67a095e77b56'
         'd32239bcb673463ab874e80d47fae504')

package() {
  install -Dm0755 petrified "${pkgdir}/usr/bin/petrified"
  install -Dm0640 petrified.conf "${pkgdir}/etc/petrified.conf" 
  install -Dm0644 petrified.logrotate "${pkgdir}/etc/logrotate.d/petrified" 
  install -dm0755 "${pkgdir}/var/cache/petrified"

  install -dm0755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m0644 petrified.conf petrified.crontab petrified.dispatch \
                 README.md "${pkgdir}/usr/share/doc/${pkgname}"
}

