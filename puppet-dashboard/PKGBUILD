# Maintainer: Patryk Kowalczyk 

pkgname=puppet-dashboard
pkgver=1.2.23
pkgrel=1
pkgdesc='Web tracking frontend to puppet'
arch=("any")
url="http://www.puppetlabs.com/puppet/related-projects/dashboard/"
license=("GPL")
depends=('ruby1.8' 'rubygems1.8' 'ruby1.8-rake' 'mysql-ruby1.8' 'puppet')
install='dashboard.install'
source=("http://puppetlabs.com/downloads/dashboard/$pkgname-$pkgver.tar.gz"
        "puppet-dashboard")

package() {
  cd $srcdir/$pkgname-$pkgver

  # Directories
  install -d $pkgdir/usr/share/$pkgname/{log,public,tmp}

  # Install
  cp -v -p -r * $pkgdir/usr/share/$pkgname/
  install -Dp -m0644 config/database.yml.example $pkgdir/usr/share/$pkgname/config/database.yml

  # rc script
  install -Dm 755 $srcdir/puppet-dashboard $pkgdir/etc/rc.d/puppet-dashboard
}

md5sums=('e445194f1ac96946e6755cb94f21a1e5'
         '689604f3893ac1403f8f77b4070e78da')
