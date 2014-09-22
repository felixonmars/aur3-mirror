# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>
# Contributor: Themaister    <maister@archlinux.us>

pkgname=retroarch-imx6-cubox-git
pkgver=13086.4eb80db
pkgrel=1
pkgdesc="Reference frontend for the libretro API. - i.MX6 Cubox-i"
arch=('armv7h')
url="http://github.com/libretro/RetroArch"
license=('GPL')
# optional build-time deps: 'openal', 'libxml2', 'nvidia-cg-toolkit', 'sdl_image'
# see: 'retroarch --features' for more.
depends=('libgl' 'gpu-viv-bin-mx6q')
optdepends=('libretro-super-git: A collection of many libretro implementations.', 'retroarch-joypad-autoconfig: Joypad config files')
makedepends=('git')
provides=('retroarch')
conflicts=('retroarch')
options=('emptydirs')
backup=('etc/retroarch.cfg')

_gitname=RetroArch
_gitname_assets="retroarch-assets"
source=("git+https://github.com/libretro/${_gitname}.git" "git+https://github.com/libretro/${_gitname_assets}")
md5sums=('SKIP' 'SKIP') 

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  ./configure --prefix=/usr --enable-gles --disable-x11 --disable-vg --disable-xvideo --disable-ffmpeg \
    --enable-neon --enable-floathard --enable-fbo --enable-vivante_fbdev --enable-freetype --enable-lakka \
    --disable-sdl --disable-kms
  make
}

package() {
  _datadir=${pkgdir}/var/lib/retroarch
  cd "${_gitname}"
  make install DESTDIR="${pkgdir}"
  install -dv -m 0777 ${_datadir}/roms ${_datadir}/savefiles ${_datadir}/savestates ${_datadir}/system \
    ${_datadir}/screenshots ${_datadir}/shaders
  install -dv ${pkgdir}/usr/share/retroarch
  cp -r ${srcdir}/${_gitname_assets}/* ${pkgdir}/usr/share/retroarch/
  install -dpv ${pkgdir}/etc/retroarch.d
  update_config
}

update_config() {
  _config_filename=${pkgdir}/etc/retroarch.cfg
  echo "Updating config"
  # General configuration
  sed -i -e "s/# libretro_path = \"\/path\/to\/libretro.so\"/libretro_path = \"\/usr\/lib\/libretro\"/" $_config_filename
  sed -i -e "s/# rgui_browser_directory =/rgui_browser_directory = \/var\/lib\/retroarch\/roms/" $_config_filename
  sed -i -e "s/# content_directory =/content_directory = \/var\/lib\/retroarch\/roms/" $_config_filename
  sed -i -e "s/# savefile_directory =/savefile_directory = \/var\/lib\/retroarch\/savefiles/" $_config_filename
  sed -i -e "s/# savestate_directory =/savestate_directory = \/var\/lib\/retroarch\/savestates/" $_config_filename
  sed -i -e "s/# system_directory =/system_directory = \/var\/lib\/retroarch\/system/" $_config_filename
  sed -i -e "s/# screenshot_directory =/screenshot_directory = \/var\/lib\/retroarch\/screenshots/" $_config_filename
  sed -i -e "s/# video_shader_dir =/video_shader_dir = \/var\/lib\/retroarch\/shaders/" $_config_filename
  sed -i -e "s/# rgui_show_start_screen = true/rgui_show_start_screen = false/" $_config_filename
  sed -i -e "s/# assets_directory =/assets_directory = \/usr\/share\/retroarch/" $_config_filename
  sed -i -e "s/# menu_driver = \"rgui\"/menu_driver = \"lakka\"/" $_config_filename
  
  # Video
  sed -i -e "s/# video_fullscreen = false/video_fullscreen = true/" $_config_filename
  sed -i -e "s/# video_smooth = true/video_smooth = false/" $_config_filename
  sed -i -e "s/# video_aspect_ratio_auto = false/video_aspect_ratio_auto = true/" $_config_filename
  #sed -i -e "s/# video_vsync = true/video_vsync = false/" $_config_filename
  #sed -i -e "s/# video_threaded = false/video_threaded = true/" $_config_filename
  #sed -i -e "s/# video_font_path =/video_font_path =\/usr\/share\/fonts\/liberation\/LiberationSans-Regular.ttf/" $_config_filename
  sed -i -e "s/# video_font_size = 48/video_font_size = 32/" $_config_filename

  # Audio
  sed -i -e "s/# audio_driver =/audio_driver = \"alsathread\"/" $_config_filename
  
  # Input
  sed -i -e "s/# input_driver = sdl/input_driver = udev/" $_config_filename
  sed -i -e "s/# input_autodetect_enable = true/input_autodetect_enable = true/" $_config_filename
  sed -i -e "s/# joypad_autoconfig_dir =/joypad_autoconfig_dir = \/etc\/retroarch.d\/joypad-autoconfig/" $_config_filename
  
  # Misc
  sed -i -e "s/# video_gpu_screenshot = true/video_gpu_screenshot = false/" $_config_filename
}
