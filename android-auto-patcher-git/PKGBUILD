# Maintainer: iruel (Tenshi Hinanawi) <cockmomgler@gmail.com>

pkgname=android-auto-patcher-git
_realname=auto-patcher
pkgver=20120909
pkgrel=1
pkgdesc="Mateorod's all-purpose Android Auto-Patcher to easily port framework changes, themes, and more across all ROMS and devices. From XDA-Developers."
arch=('any')
url="http://forum.xda-developers.com/showthread.php?t=1719408"
license=('unknown')		# N/A, the author has not given one
depends=('bash' 'java-environment' 'cpio' 'patch')
makedepends=('git')
#install=$_realname.install
md5sums=()

# github links and names
_gitroot=git://github.com/mateor/$_realname.git
_gitname=$_realname

# directory for patches to be stored in (no '/' before and after plz)
_patchdir=usr/share/auto-patcher

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # zips up the patches for auto_patcher
  bash "$srcdir/$_gitname-build/batch.sh"
  
  # Same code as above script, just in case
#   cd "$srcdir/$_gitname-build/patch_tools"
#   tar cvzf ../patch_tools.tgz aapt* *.jar updatecert.pem updatekey.pk8 update-template.zip boot
#   cd "$srcdir/$_gitname-build/"
# 
#   tar cvzf patch_patches.tgz patches
# 
#   zip autopatcher.zip auto_patcher patch_tools.tgz patch_patches.tgz
}

package() {
  cd "$srcdir/$_gitname-build"
  
  # move autopatcher libs to /usr/lib/
  mkdir -p "$pkgdir/$_patchdir/"
  cp patch_patches.tgz "$pkgdir/$_patchdir/patch_patches.tgz"
  cp patch_tools.tgz "$pkgdir/$_patchdir/patch_tools.tgz"
  
  # set autopatcher script to use new directory
  sed -i "s|=\"\$ROOT|=\"/$_patchdir|" auto_patcher
  
  # Place autopatcher script in /usr/bin
  mkdir -p "$pkgdir/usr/bin/"
  cp auto_patcher $pkgdir/usr/bin/auto_patcher
}

# vim:set ts=2 sw=2 et:
 
