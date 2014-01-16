# $Id$
# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid

pkgname=rightscale-control
_gitref=v5.9.5
pkgver=5.9.5
pkgrel=6
pkgdesc='Scripts for system and service control of RightScale RightLink including binstubs.'
arch=('i686' 'x86_64' 'armv6h')
url=https://github.com/flaccid/rightscale-control
license=(custom:RightScale)
depends=(bash lsb-release dnsutils util-linux)
conflicts=(rightscale-deb)
install=rightscale-control.install
source=(
  "https://github.com/flaccid/rightscale-control/archive/${_gitref}.tar.gz"
  rightscale_functions-lsb.patch
)
md5sums=('0629a594f3d6a94abc9c2ae46a8d7c83'
         '359154744d6231eb90d2723b007ae774')

_rl_prefix=opt/rightscale

package() {
  msg 'Add service control scripts.'
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rightlink_decommission" "$pkgdir/usr/bin/rightlink_decommission"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rightlink_restart" "$pkgdir/usr/bin/rightlink_restart"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rightlink_resume" "$pkgdir/usr/bin/rightlink_resume"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rightlink_start" "$pkgdir/usr/bin/rightlink_start"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rightlink_status" "$pkgdir/usr/bin/rightlink_status"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rightlink_stop" "$pkgdir/usr/bin/rightlink_stop"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rightscale_start" "$pkgdir/usr/bin/rightscale_start"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rightscale_stop" "$pkgdir/usr/bin/rightscale_stop"

  msg 'Add RightLink CLI commands.'
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rs_connect" "$pkgdir/usr/bin/rs_connect"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rs_log_level" "$pkgdir/usr/bin/rs_log_level"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rs_ohai" "$pkgdir/usr/bin/rs_ohai"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rs_reenroll" "$pkgdir/usr/bin/rs_reenroll"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rs_run_recipe" "$pkgdir/usr/bin/rs_run_recipe"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rs_run_right_script" "$pkgdir/usr/bin/rs_run_right_script"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rs_shutdown" "$pkgdir/usr/bin/rs_shutdown"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rs_state" "$pkgdir/usr/bin/rs_state"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rs_tag" "$pkgdir/usr/bin/rs_tag"
  install -D "$srcdir/$pkgname-$pkgver/usr/bin/rs_thunk" "$pkgdir/usr/bin/rs_thunk"

  msg 'Add bin/ binstubs.'
  install -D "$srcdir/$pkgname-$pkgver/bin/ec2/wait_for_eip.rb" "$pkgdir/$_rl_prefix/bin/ec2/wait_for_eip.rb"
  install -D "$srcdir/$pkgname-$pkgver/bin/rackspace/wait_for_instance_ready.rb" "$pkgdir/$_rl_prefix/bin/rackspace/wait_for_instance_ready.rb"
  install -D "$srcdir/$pkgname-$pkgver/bin/cloud" "$pkgdir/$_rl_prefix/bin/cloud"
  install -D "$srcdir/$pkgname-$pkgver/bin/cook_runner" "$pkgdir/$_rl_prefix/bin/cook_runner"
  install -D "$srcdir/$pkgname-$pkgver/bin/deploy" "$pkgdir/$_rl_prefix/bin/deploy"
  install -D "$srcdir/$pkgname-$pkgver/bin/enroll" "$pkgdir/$_rl_prefix/bin/enroll"
  install -D "$srcdir/$pkgname-$pkgver/bin/rad" "$pkgdir/$_rl_prefix/bin/rad"
  install -D "$srcdir/$pkgname-$pkgver/bin/rchk" "$pkgdir/$_rl_prefix/bin/rchk"
  install -D "$srcdir/$pkgname-$pkgver/bin/rnac" "$pkgdir/$_rl_prefix/bin/rnac"
  install -D "$srcdir/$pkgname-$pkgver/bin/rs_thunk" "$pkgdir/$_rl_prefix/bin/rs_thunk"
  install -D "$srcdir/$pkgname-$pkgver/bin/rstat" "$pkgdir/$_rl_prefix/bin/rstat"
  install -D "$srcdir/$pkgname-$pkgver/bin/system" "$pkgdir/$_rl_prefix/bin/system"

  msg 'Add etc files.'
  install -D "$srcdir/$pkgname-$pkgver/etc/rightscale.d/cloud" "$pkgdir/etc/rightscale.d/cloud"
  install -D "$srcdir/$pkgname-$pkgver/etc/motd" "$pkgdir/$_rl_prefix/etc/motd"
  install -D "$srcdir/$pkgname-$pkgver/etc/motd-complete" "$pkgdir/$_rl_prefix/etc/motd-complete"
  install -D "$srcdir/$pkgname-$pkgver/etc/motd-failed" "$pkgdir/$_rl_prefix/etc/motd-failed"
  install -D "$srcdir/$pkgname-$pkgver/etc/sudoers.d/rightscale" "$pkgdir/$_rl_prefix/etc/sudoers.d/rightscale"
  install -D "$srcdir/$pkgname-$pkgver/etc/sudoers.d/rightscale_users" "$pkgdir/$_rl_prefix/etc/sudoers.d/rightscale_users"

  msg 'Add functions.'
  install -D "$srcdir/$pkgname-$pkgver/lib/rightscale_functions" "$pkgdir/$_rl_prefix/lib/rightscale_functions"

  msg 'Add sandbox bin scripts.'
  mkdir -p "$pkgdir/$_rl_prefix/sandbox/bin"
  cp "$srcdir/$pkgname-$pkgver"/sandbox/bin/* "$pkgdir/$_rl_prefix/sandbox/bin/"
  
  # also install to system
  msg ' Add sudoers configs.'
  install -D -m750 "$srcdir/$pkgname-$pkgver/etc/sudoers.d/rightscale" "$pkgdir/etc/sudoers.d/rightscale"
  install -D -m750 "$srcdir/$pkgname-$pkgver/etc/sudoers.d/rightscale_users" "$pkgdir/etc/sudoers.d/rightscale_users"
  chmod 750 "$pkgdir/etc/sudoers.d"

  pushd "$pkgdir"
  	msg "Applying patch for system_configurator.rb..."
  	patch -p0 < "$startdir/rightscale_functions-lsb.patch"
  popd

  msg 'Adding share docs to package.'
	install -D "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/$pkgname/LICENSE"
	install -D "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/$pkgname/README.md"
}

# vim:syntax=sh