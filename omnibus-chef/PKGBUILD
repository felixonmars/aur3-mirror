# $Id$
# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Package Build Source: https://github.com/flaccid/archlinux-packages/blob/master/omnibus-chef/PKGBUILD

# Build a specific version by environment variable instead of editing this file:
# sudo CHEF_VERSION=11.10.4 makepkg -s

# omnibus-chef (FPM) uses directories under system locations such as /opt and /var,
#     making user builds a pain for non-root users!
#
# directories that need permission for the user running makepkg:
# /opt/chef
# /var/cache/omnibus

# Change the log level:
# sudo CHEF_LOG_LEVEL=debug makepkg -s

pkgname=omnibus-chef
_pkgver=chef-12.0.3
pkgver=12.0.3
_chefver=12.0.3
pkgrel=1
pkgdesc="Omnibus packaging for Chef (provides a Makeself installer for Chef $_chefver)."
arch=(any)
url="https://github.com/opscode/omnibus-chef"
license=('Apache 2.0')
install="$pkgname.install"
makedepends=(git ruby-bundler)
conflicts=(omnibus-chef-git)
replaces=(omnibus-chef-git)
source=("https://github.com/opscode/$pkgname/archive/$_pkgver.tar.gz")
md5sums=('4932b8675f3c83baa83cd5386b469f1f')

: "${CHEF_VERSION:=$_chefver}"
: "${CHEF_LOG_LEVEL:=error}"

pkgver() {
  echo "$pkgver"
}

prepare() {
  msg 'Initialising system chef directories.'
  mkdir -p /opt/chef /var/cache/omnibus
  rm -Rf /opt/chef/* /var/cache/omnibus/*

  pushd "$srcdir/$pkgname-$_pkgver"
    msg 'Removing any existing built makeself installers.'
    rm -Rf "pkg/chef-$CHEF_VERSION"{*.run,*.sh}

    msg 'Preparing bundle...'

    msg 'Installing required gems...'
    bundle install --without development
    [ "$CHEF_LOG_LEVEL" = 'debug' ] && bundle show --paths

    msg 'Cleaning temporary files...'
    bundle exec omnibus clean chef
  popd

  # why is this needed?! (use the system's bundler)
  mkdir -p /opt/chef/embedded/bin
  ln -svf /usr/bin/bundle /opt/chef/embedded/bin/bundle

  echo "override :chef,   version: \"$CHEF_VERSION\"" >> "$srcdir/$pkgname-$_pkgver/config/projects/chef.rb"
}

build() {
  pushd "$srcdir/$pkgname-$_pkgver"
    msg "Building omnibus chef (version $CHEF_VERSION)..."
    if [[ "$CHEF_LOG_LEVEL" =~ ^(error|warning)$ ]]; then
      echo '(please be patient)'
    fi
    bundle exec omnibus build chef -l "$CHEF_LOG_LEVEL"
  popd
}

package() {
  install -m755 -d "$pkgdir/usr/local/sbin"
  cp -v "$srcdir/$pkgname-$_pkgver/pkg/chef-$CHEF_VERSION"*.sh "$pkgdir/usr/local/sbin/"
  for chef_installer in "$pkgdir/usr/local/sbin/chef-"*; do break; done
  pushd "$pkgdir/usr/local/sbin"
    ln -sv ./"$(basename $chef_installer)" ./chef-installer
  popd
}

# vim:set ts= 2 sw=2 Et:
