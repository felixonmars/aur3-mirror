# Maintainer: Max Meyer <dev@fedux.org>
pkgname=local_pac
pkgver=0.1.5
pkgrel=2
pkgdesc="local pacfile serving server"
arch=(i686 x86_64)
url="https://github.com/dg-vrnetze/${pkgname}"
license=('MIT')
depends=(ruby)
makedepends=(rubygems filegen)
source=(http://gems.rubyforge.org/gems/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('66a8c53ab984ee3d3bedafeefc195e0c43d33a23da204f1987624ee67c2fb9f6')

package() {
  cd "$srcdir"

  _library_dir=/usr/lib/${pkgname}
  _share_dir="${_library_dir}/gems/${pkgname}-${pkgver}/share"
  _systemd_dir=/usr/lib/systemd/system
  _bin_dir=/usr/bin

  install -d ${pkgdir}/$_library_dir 
  install -d ${pkgdir}/$_bin_dir 
  install -d ${pkgdir}/$_systemd_dir 

  GEM_HOME="${pkgdir}/${_library_dir}" GEM_ROOT="${pkgdir}/${_library_dir}" GEM_PATH="${pkgdir}/${_library_dir}" gem install --env-shebang --wrappers --no-ri --no-rdoc --install-dir ${pkgdir}/${_library_dir} $pkgname

  SOFTWARE_BINARY=$_library_dir/gems/${pkgname}-${pkgver}/bin/${pkgname} SOFTWARE_LIB=/usr/lib/local_pac filegen  ${pkgdir}${_share_dir}/archlinux/startup.erb > ${pkgdir}${_bin_dir}/${pkgname}

  chmod a+x ${pkgdir}/${_bin_dir}/${pkgname}
  rm -rf ${pkgdir}/${_library_dir}/cache
  rm -rf ${pkgdir}/${_library_dir}/{build_info,doc}

  install -D -m644 ${pkgdir}/$_share_dir/systemd/${pkgname}.service ${pkgdir}/$_systemd_dir
  install -D -m644 ${pkgdir}/$_share_dir/systemd/${pkgname}@.service ${pkgdir}/$_systemd_dir
  #install -D -m644 ${pkgdir}/$_share_dir/systemd/${pkgname}.socket ${pkgdir}/$_systemd_dir

  install -D -m644 ${pkgdir}${_share_dir}/../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
