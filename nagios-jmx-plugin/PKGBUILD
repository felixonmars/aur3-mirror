# Contributor: David Rosenstrauch <darose@darose.net>
pkgname=nagios-jmx-plugin
pkgver=1.0
pkgrel=1
pkgdesc="Java JMX Nagios plugin enables you to monitor JMX attributes in Nagios"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/nagioscheckjmx/"
license=('GPL')
depends=('nagios' 'java-runtime')
source=('http://prdownloads.sourceforge.net/nagioscheckjmx/check_jmx.tar.gz')
md5sums=('277974110d25affe845a23c73d933319')

build() {
  cd "$srcdir/check_jmx"

  install -d $startdir/pkg/usr/share/nagios/libexec/
  install -m755 nagios/plugin/* $startdir/pkg/usr/share/nagios/libexec/
}
