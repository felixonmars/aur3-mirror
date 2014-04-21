# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Luca Cesari <mirshann (at) bewq (dot) org>
# Contributor: Thomas S Hatch <thatch45 (at) Gmail (dot) com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Miah Johnson <miah (at) chia-pet dot org>
# Contributor: Dave Simons <miouhpi (at) Gmail (dot) com>

_pkgname=puppet
pkgname=puppet-git
pkgver=3.5.1.r287.g1fb1504
pkgrel=2
pkgdesc="Server automation framework and application"
arch=('any')
url="http://puppetlabs.com/puppet/puppet-open-source"
license=('APACHE')
depends=('facter' 'hiera' 'logrotate' 'ruby-shadow')
provides=('puppet')
conflicts=('puppet')
backup=('etc/puppet/auth.conf' 'etc/puppet/fileserver.conf'
        'etc/puppet/puppet.conf' 'etc/puppet/tagmail.conf')
install=$_pkgname.install
source=(git://github.com/puppetlabs/puppet.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_pkgname

  git describe | sed -r 's/([^-]*-g)/r\1/;s/-/./g' 
}

package() {
  cd "$srcdir"/$_pkgname

  ruby install.rb --destdir="$pkgdir"/ --sitelibdir="$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' )"

  install -Dm644 "$srcdir"/$_pkgname/ext/redhat/$_pkgname.conf \
    "$pkgdir"/etc/$_pkgname/$_pkgname.conf
  install -Dm644 "$srcdir"/$_pkgname/ext/redhat/logrotate \
    "$pkgdir"/etc/logrotate.d/$_pkgname
  install -Dm644 "$srcdir"/$_pkgname/conf/fileserver.conf \
    "$pkgdir"/etc/$_pkgname/fileserver.conf
  install -Dm644 "$srcdir"/$_pkgname/conf/tagmail.conf \
    "$pkgdir"/etc/$_pkgname/tagmail.conf

  install -d "$pkgdir"/{var/lib/$_pkgname,usr/lib/tmpfiles.d}/

  echo "d /var/run/$_pkgname 0755 $_pkgname $_pkgname -" > \
    "$pkgdir"/usr/lib/tmpfiles.d/$_pkgname.conf

  # systemd
  install -Dm644 "$srcdir"/$_pkgname/ext/systemd/$_pkgname.service \
    "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
  install -Dm644 "$srcdir"/$_pkgname/ext/systemd/${_pkgname}master.service \
    "$pkgdir"/usr/lib/systemd/system/${_pkgname}master.service

  # vim and emacs
  install -Dm644 "$srcdir"/$_pkgname/ext/vim/ftdetect/$_pkgname.vim \
    "$pkgdir"/usr/share/vim/vimfiles/ftdetect/$_pkgname.vim
  install -Dm644 "$srcdir"/$_pkgname/ext/vim/syntax/$_pkgname.vim \
    "$pkgdir"/usr/share/vim/vimfiles/syntax/$_pkgname.vim
  install -Dm644 "$srcdir"/$_pkgname/ext/emacs/$_pkgname-mode.el \
    "$pkgdir"/usr/share/emacs/site-lisp/$_pkgname-mode.el
  install -Dm644 "$srcdir"/$_pkgname/ext/emacs/$_pkgname-mode-init.el \
    "$pkgdir"/usr/share/emacs/site-lisp/site-start.d/$_pkgname-mode-init.el

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
