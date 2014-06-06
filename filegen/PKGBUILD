# Maintainer: Max Meyer <dev@fedux.org>
pkgname=filegen
pkgver=0.4.3
pkgrel=1
pkgdesc="generating files made easy"
arch=(i686 x86_64)
url="https://github.com/dg-vrnetze/${pkgname}"
license=('MIT')
depends=(ruby)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('eecea0437fdec9db8de50880faef82d15c81e37fb0655bcbb8b6ac0db9f407b4')

package() {
  cd "$srcdir"

  _library_dir=/usr/lib/${pkgname}
  _share_dir="${_library_dir}/gems/${pkgname}-${pkgver}/share"
  _systemd_dir=/usr/lib/systemd/system
  _bin_dir=/usr/bin

  install -d ${pkgdir}${_library_dir}
  install -d ${pkgdir}${_bin_dir}

  gem install --env-shebang --wrappers --no-ri --no-rdoc --install-dir ${pkgdir}/${_library_dir} $pkgname 

  echo '#!/usr/bin/env bash'                                               >> ${pkgdir}${_bin_dir}/${pkgname}
  echo "export GEM_HOME='${_library_dir}'"                                 >> ${pkgdir}${_bin_dir}/${pkgname}
  echo "export GEM_PATH='${_library_dir}'"                                 >> ${pkgdir}${_bin_dir}/${pkgname}
  echo "export GEM_ROOT='${_library_dir}'"                                 >> ${pkgdir}${_bin_dir}/${pkgname}
  echo "exec ${_library_dir}/gems/${pkgname}-${pkgver}/bin/${pkgname} \$*" >> ${pkgdir}${_bin_dir}/${pkgname}

  chmod a+x ${pkgdir}${_bin_dir}/${pkgname}
  rm -r ${pkgdir}${_library_dir}/cache
}

# vim:set ts=2 sw=2 et:
