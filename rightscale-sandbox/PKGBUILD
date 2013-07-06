# Maintainer: Brian Szmyd <brian.szmyd@rightscale.com>
# Contributor: Chris Fordham <chris.fordham@rightscale.com>

# VCS files:
# https://github.com/flaccid/archlinux-packages/blob/master/rightscale-sandbox/PKGBUILD
# https://github.com/flaccid/archlinux-packages/blob/master/rightscale-sandbox/Gemfile.patch

pkgname=rightscale-sandbox
pkgver=5.8.13
pkgrel=2
pkgdesc='RightScale RightLink Ruby/RubyGems sandbox.'
arch=('i686' 'x86_64' 'armv6h')
url="http://rightscale.com/"
license=(MIT RUBY)
makedepends=(autoconf sed tar libxslt)
conflicts=(rightscale-deb)
options=(emptydirs strip !docs !libtool !staticlibs )

_rl_prefix="/opt/rightscale"
_sandbox_dir="${_rl_prefix}/sandbox"
_rb_gitname=ruby
_rb_pkgver=1.8.7-p371
_rb_gitdir="${_rb_gitname}-${_rb_pkgver}"
_rg_gitname=rubygems
_rg_pkgver=1.6.2
_rg_gitdir="${_rg_gitname}-${_rg_pkgver}"

source=(
	"http://ftp.ruby-lang.org/pub/ruby/1.8/${_rb_gitname}-${_rb_pkgver}.tar.gz"
	"http://production.cf.rubygems.org/rubygems/${_rg_gitname}-${_rg_pkgver}.tgz"
	"https://raw.github.com/rightscale/right_link/v${pkgver}/Gemfile"
	"https://raw.github.com/rightscale/right_link/v${pkgver}/Gemfile.lock"
)
md5sums=('653f07bb45f03d0bf3910491288764df'
         '0c95a9869914ba1a45bf71d3b8048420'
         '4b5390466bf243d74976e9ba2c2c6938'
         'affe4a7a960e633971deece667248504')		 # generate with 'makepkg -g'

ruby_cmd() {
  # These are some LOAD_PATHs that need to be manually added to ruby
  # since it's not installed in the /opt yet.
  local lib_paths=$(for path in ${ruby_libs[@]}; do echo "-I${ruby_dir}/lib/ruby/${path}"; done)

  RUBYOPT="${lib_paths}" \
    ${ruby_dir}/bin/ruby ${@}
}

build() {
  msg 'Building Ruby...'
  pushd ${_rb_gitdir}
    autoconf
    ./configure \
      --prefix="${_sandbox_dir}" \
      --enable-pthread
    make
  popd
}

package() {
  pushd "$startdir"
    msg "Applying Gemfile patch..."
    patch -p0 -R < Gemfile.patch
  popd

  ruby_dir=${pkgdir}/${_sandbox_dir}
  ruby_libs=()

  msg 'Installing Ruby into package...'
  pushd ${_rb_gitdir}
    make DESTDIR=${pkgdir} install
    ruby_libs+=(1.8 1.8/${CARCH}-linux)
  popd

  msg 'Installing RubyGems into package...'
  pushd ${_rg_gitdir}
    msg 'Running setup.rb...'
    ruby_cmd ./setup.rb --no-ri --no-rdoc

    ruby_libs+=(site_ruby/1.8)

    msg 'Installing bundle RubyGem...'
    ruby_cmd ${ruby_dir}/bin/gem install bundle --no-rdoc --no-ri
    
    msg "Modifying shebang in ${ruby_dir}/bin/gem..."
    sed -i "s@${pkgdir}@@" ${ruby_dir}/bin/gem

    # if bundle/r gems found in user's home, copy them in for use
    shopt -s nullglob dotglob
    for f in $HOME/.gem/ruby/1.8/gems/bundle-*; do
      test -d "$f" || continue
      msg 'Copying bundle(r) RubyGems from system user...'
      mkdir -p ${pkgdir}/${_sandbox_dir}/lib/ruby/gems/1.8/gems
      mkdir -p ${pkgdir}/${_sandbox_dir}/lib/ruby/gems/1.8/bin
      cp -R "$HOME"/.gem/ruby/1.8/gems/bundle* ${pkgdir}/${_sandbox_dir}/lib/ruby/gems/1.8/gems/
      cp -R "$HOME"/.gem/ruby/1.8/bin/bundle ${pkgdir}/${_sandbox_dir}/lib/ruby/gems/1.8/bin/
    done
  popd

  pushd ${srcdir}
    msg 'Performing bundle install...'
    ruby_cmd ${ruby_dir}/lib/ruby/gems/1.8/bin/bundle install
  popd

  # TODO: find out why; fix in da upstream
  msg 'Adding in missing gem versions...'
  ruby_cmd ${ruby_dir}/bin/gem install treetop --version=1.4.10
  ruby_cmd ${ruby_dir}/bin/gem install right_aws --version=3.0.4
  ruby_cmd ${ruby_dir}/bin/gem install systemu --version=2.5.1
}

# vim:syntax=sh